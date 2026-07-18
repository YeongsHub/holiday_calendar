import 'package:flutter_test/flutter_test.dart';
import 'package:holiday_calendar/core/error/exceptions.dart';
import 'package:holiday_calendar/core/error/failures.dart';
import 'package:holiday_calendar/data/datasources/holiday_local_datasource.dart';
import 'package:holiday_calendar/data/datasources/holiday_remote_datasource.dart';
import 'package:holiday_calendar/data/models/open_holiday_model.dart';
import 'package:holiday_calendar/data/repositories/holiday_repository_impl.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';

import '../../helpers/test_data.dart';

// ── Mock data sources ──────────────────────────────────────

class MockRemoteDataSource implements HolidayRemoteDataSource {
  List<OpenHolidayModel>? _result;
  Exception? _exception;
  int callCount = 0;

  void setResult(List<OpenHolidayModel> result) {
    _result = result;
    _exception = null;
  }

  void setException(Exception exception) {
    _exception = exception;
    _result = null;
  }

  @override
  Future<List<OpenHolidayModel>> getHolidays(int year,
      {String countryCode = 'DE'}) async {
    callCount++;
    if (_exception != null) throw _exception!;
    return _result ?? [];
  }

  @override
  Future<List<OpenHolidayModel>> getSchoolHolidays(
      int year, String subdivisionCode,
      {String countryCode = 'DE'}) async {
    return [];
  }
}

class MockLocalDataSource implements HolidayLocalDataSource {
  List<Holiday> _cachedHolidays = [];
  bool _cacheValid = false;
  bool _throwOnAccess = false;
  int cacheHolidaysCallCount = 0;

  void setCachedHolidays(List<Holiday> holidays) {
    _cachedHolidays = holidays;
  }

  void setCacheValid(bool valid) {
    _cacheValid = valid;
  }

  void setThrowOnAccess(bool shouldThrow) {
    _throwOnAccess = shouldThrow;
  }

  @override
  Future<List<Holiday>> getHolidays(int year, {String countryCode = 'DE'}) async {
    if (_throwOnAccess) throw const CacheException(message: 'DB corrupted');
    return _cachedHolidays;
  }

  @override
  Future<void> cacheHolidays(int year, List<Holiday> holidays,
      {String countryCode = 'DE'}) async {
    if (_throwOnAccess) throw const CacheException(message: 'DB write failed');
    _cachedHolidays = holidays;
    cacheHolidaysCallCount++;
  }

  @override
  Future<bool> isCacheValid(int year, {String countryCode = 'DE'}) async {
    if (_throwOnAccess) throw const CacheException(message: 'DB read failed');
    return _cacheValid;
  }

  @override
  Future<void> clearCache() async {
    _cachedHolidays = [];
  }
}

void main() {
  late HolidayRepositoryImpl repository;
  late MockRemoteDataSource mockRemote;
  late MockLocalDataSource mockLocal;

  setUp(() {
    mockRemote = MockRemoteDataSource();
    mockLocal = MockLocalDataSource();
    repository = HolidayRepositoryImpl(
      remoteDataSource: mockRemote,
      localDataSource: mockLocal,
    );
  });

  group('Offline-first 전략 검증', () {
    test('캐시 유효 + 데이터 있으면 캐시 반환, API 미호출', () async {
      mockLocal.setCacheValid(true);
      mockLocal.setCachedHolidays(TestData.allHolidays);

      final result = await repository.getHolidays(2026);

      expect(result.isRight(), isTrue);
      result.fold(
        (_) => fail('Should be Right'),
        (holidays) => expect(holidays.length, TestData.allHolidays.length),
      );
      expect(mockRemote.callCount, 0);
    });

    test('캐시 만료 → API 호출', () async {
      mockLocal.setCacheValid(false);
      mockRemote.setResult([]);

      final result = await repository.getHolidays(2026);

      expect(result.isRight(), isTrue);
      expect(mockRemote.callCount, 1);
    });

    test('캐시 유효하지만 비어있으면 API 호출', () async {
      mockLocal.setCacheValid(true);
      mockLocal.setCachedHolidays([]);
      mockRemote.setResult([]);

      final result = await repository.getHolidays(2026);

      expect(result.isRight(), isTrue);
      expect(mockRemote.callCount, 1);
    });
  });

  group('네트워크 에러 핸들링', () {
    test('네트워크 에러 + 캐시 있음 → 캐시 fallback', () async {
      mockLocal.setCacheValid(false);
      mockLocal.setCachedHolidays(TestData.allHolidays);
      mockRemote.setException(
        const NetworkException(message: 'No internet connection'),
      );

      final result = await repository.getHolidays(2026);

      expect(result.isRight(), isTrue);
      result.fold(
        (_) => fail('Should fallback to cache'),
        (holidays) => expect(holidays.length, TestData.allHolidays.length),
      );
    });

    test('네트워크 에러 + 캐시 없음 → NetworkFailure', () async {
      mockLocal.setCacheValid(false);
      mockLocal.setCachedHolidays([]);
      mockRemote.setException(
        const NetworkException(message: 'No internet connection'),
      );

      final result = await repository.getHolidays(2026);

      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) => expect(failure, isA<NetworkFailure>()),
        (_) => fail('Should be Left'),
      );
    });

    test('서버 에러 500 + 캐시 없음 → ServerFailure', () async {
      mockLocal.setCacheValid(false);
      mockLocal.setCachedHolidays([]);
      mockRemote.setException(
        const ServerException(message: 'Internal Server Error', statusCode: 500),
      );

      final result = await repository.getHolidays(2026);

      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (_) => fail('Should be Left'),
      );
    });

    test('서버 에러 + 캐시 있음 → ServerFailure (ServerException은 fallback 안 함)', () async {
      mockLocal.setCacheValid(false);
      mockLocal.setCachedHolidays(TestData.allHolidays);
      mockRemote.setException(
        const ServerException(message: 'Internal Server Error', statusCode: 500),
      );

      final result = await repository.getHolidays(2026);

      // ServerException은 _fetchAndCacheHolidays에서 catch되어
      // Left(ServerFailure)를 직접 반환함 — 캐시 fallback하지 않음
      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (_) => fail('Should be Left'),
      );
    });
  });

  group('캐시 에러 핸들링', () {
    test('캐시 접근 실패 → API에서 직접 가져옴', () async {
      mockLocal.setThrowOnAccess(true);
      mockRemote.setResult([]);

      final result = await repository.getHolidays(2026);

      expect(result.isRight(), isTrue);
      expect(mockRemote.callCount, 1);
    });
  });
}
