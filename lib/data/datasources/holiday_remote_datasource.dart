import 'package:dio/dio.dart';
import 'package:holiday_calendar/core/constants/api_constants.dart';
import 'package:holiday_calendar/core/error/exceptions.dart';
import 'package:holiday_calendar/data/models/open_holiday_model.dart';

abstract class HolidayRemoteDataSource {
  Future<List<OpenHolidayModel>> getHolidays(int year,
      {String countryCode = 'DE'});
  Future<List<OpenHolidayModel>> getSchoolHolidays(
      int year, String subdivisionCode,
      {String countryCode = 'DE'});
}

class HolidayRemoteDataSourceImpl implements HolidayRemoteDataSource {
  final Dio dio;

  HolidayRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<OpenHolidayModel>> getHolidays(int year,
      {String countryCode = 'DE'}) async {
    try {
      final response = await dio.get(
        ApiConstants.publicHolidaysEndpoint(year, country: countryCode),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => OpenHolidayModel.fromJson(json)).toList();
      } else {
        throw ServerException(
          message: 'Failed to fetch holidays',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        throw const NetworkException(message: 'No internet connection');
      }
      throw ServerException(
        message: e.message ?? 'Unknown error',
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<List<OpenHolidayModel>> getSchoolHolidays(
      int year, String subdivisionCode,
      {String countryCode = 'DE'}) async {
    try {
      final response = await dio.get(
        ApiConstants.schoolHolidaysEndpoint(year, subdivisionCode,
            country: countryCode),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => OpenHolidayModel.fromJson(json)).toList();
      } else {
        throw ServerException(
          message: 'Failed to fetch school holidays',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        throw const NetworkException(message: 'No internet connection');
      }
      throw ServerException(
        message: e.message ?? 'Unknown error',
        statusCode: e.response?.statusCode,
      );
    }
  }
}
