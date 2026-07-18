import 'package:dartz/dartz.dart';
import 'package:holiday_calendar/core/error/exceptions.dart';
import 'package:holiday_calendar/core/error/failures.dart';
import 'package:holiday_calendar/data/datasources/holiday_local_datasource.dart';
import 'package:holiday_calendar/data/datasources/holiday_remote_datasource.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';
import 'package:holiday_calendar/domain/repositories/holiday_repository.dart';

/// Repository implementation with offline-first strategy
///
/// Data flow:
/// 1. Check if local cache is valid (within 24 hours)
/// 2. If valid, return cached data
/// 3. If invalid or missing, fetch from OpenHolidays API
/// 4. Cache the fetched data locally
/// 5. Return the data
class HolidayRepositoryImpl implements HolidayRepository {
  final HolidayRemoteDataSource remoteDataSource;
  final HolidayLocalDataSource localDataSource;

  HolidayRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Holiday>>> getHolidays(int year,
      {String countryCode = 'DE'}) async {
    try {
      // Step 1: Check if cache is valid
      final isCacheValid =
          await localDataSource.isCacheValid(year, countryCode: countryCode);

      if (isCacheValid) {
        // Step 2: Return cached data
        final cachedHolidays =
            await localDataSource.getHolidays(year, countryCode: countryCode);
        if (cachedHolidays.isNotEmpty) {
          return Right(cachedHolidays);
        }
      }

      // Step 3: Fetch from remote API
      return await _fetchAndCacheHolidays(year, countryCode);
    } on CacheException {
      // Cache error - try to fetch from remote
      return await _fetchFromRemote(year, countryCode);
    } catch (e) {
      // Try to return cached data as fallback
      return await _fallbackToCache(year, countryCode, e);
    }
  }

  /// Fetch holidays from remote API and cache them
  Future<Either<Failure, List<Holiday>>> _fetchAndCacheHolidays(
      int year, String countryCode) async {
    try {
      final holidayModels =
          await remoteDataSource.getHolidays(year, countryCode: countryCode);
      final holidays = holidayModels
          .map((model) => model.toEntity(countryCode: countryCode))
          .toList();

      // Step 4: Cache the fetched data
      await localDataSource.cacheHolidays(year, holidays,
          countryCode: countryCode);

      // Step 5: Return the data
      return Right(holidays);
    } on ServerException catch (e) {
      return Left(Failure.server(message: e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      // Network error - try to return cached data
      return await _fallbackToCache(year, countryCode, e);
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  /// Fetch from remote without caching (used when cache fails)
  Future<Either<Failure, List<Holiday>>> _fetchFromRemote(
      int year, String countryCode) async {
    try {
      final holidayModels =
          await remoteDataSource.getHolidays(year, countryCode: countryCode);
      final holidays = holidayModels
          .map((model) => model.toEntity(countryCode: countryCode))
          .toList();
      return Right(holidays);
    } on ServerException catch (e) {
      return Left(Failure.server(message: e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(message: e.message));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  /// Fallback to cached data when remote fetch fails
  Future<Either<Failure, List<Holiday>>> _fallbackToCache(
      int year, String countryCode, dynamic originalError) async {
    try {
      final cachedHolidays =
          await localDataSource.getHolidays(year, countryCode: countryCode);
      if (cachedHolidays.isNotEmpty) {
        return Right(cachedHolidays);
      }
    } catch (_) {
      // Cache access failed too
    }

    // No cache available, return original error
    if (originalError is NetworkException) {
      return Left(Failure.network(message: originalError.message));
    } else if (originalError is ServerException) {
      return Left(Failure.server(
        message: originalError.message,
        statusCode: originalError.statusCode,
      ));
    }
    return Left(Failure.unknown(message: originalError.toString()));
  }

  /// Force refresh from API (bypass cache)
  Future<Either<Failure, List<Holiday>>> refreshHolidays(int year,
      {String countryCode = 'DE'}) async {
    return await _fetchAndCacheHolidays(year, countryCode);
  }

  /// Clear all cached data
  Future<void> clearCache() async {
    await localDataSource.clearCache();
  }
}
