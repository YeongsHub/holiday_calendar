import 'package:dartz/dartz.dart';
import 'package:holiday_calendar/core/error/failures.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';
import 'package:holiday_calendar/domain/repositories/holiday_repository.dart';

/// Mock repository that can be configured to return success or failure
class MockHolidayRepository implements HolidayRepository {
  Either<Failure, List<Holiday>>? _result;
  Duration _delay;
  int getHolidaysCallCount = 0;
  int? lastRequestedYear;

  MockHolidayRepository({
    Either<Failure, List<Holiday>>? result,
    Duration delay = Duration.zero,
  })  : _result = result,
        _delay = delay;

  void setResult(Either<Failure, List<Holiday>> result) {
    _result = result;
  }

  void setDelay(Duration delay) {
    _delay = delay;
  }

  @override
  Future<Either<Failure, List<Holiday>>> getHolidays(int year,
      {String countryCode = 'DE'}) async {
    getHolidaysCallCount++;
    lastRequestedYear = year;

    if (_delay > Duration.zero) {
      await Future.delayed(_delay);
    }

    return _result ?? const Right([]);
  }
}

/// Mock repository that simulates network error
class NetworkErrorRepository implements HolidayRepository {
  @override
  Future<Either<Failure, List<Holiday>>> getHolidays(int year,
      {String countryCode = 'DE'}) async {
    return const Left(
      Failure.network(message: 'No internet connection'),
    );
  }
}

/// Mock repository that simulates server error
class ServerErrorRepository implements HolidayRepository {
  @override
  Future<Either<Failure, List<Holiday>>> getHolidays(int year,
      {String countryCode = 'DE'}) async {
    return const Left(
      Failure.server(message: 'Internal Server Error', statusCode: 500),
    );
  }
}

/// Mock repository that simulates slow network then success
class SlowRepository implements HolidayRepository {
  final List<Holiday> holidays;
  final Duration delay;

  SlowRepository({
    required this.holidays,
    this.delay = const Duration(seconds: 5),
  });

  @override
  Future<Either<Failure, List<Holiday>>> getHolidays(int year,
      {String countryCode = 'DE'}) async {
    await Future.delayed(delay);
    return Right(holidays);
  }
}
