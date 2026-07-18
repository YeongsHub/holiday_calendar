import 'package:dartz/dartz.dart';
import 'package:holiday_calendar/core/error/failures.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';

abstract class HolidayRepository {
  Future<Either<Failure, List<Holiday>>> getHolidays(int year,
      {String countryCode = 'DE'});
}
