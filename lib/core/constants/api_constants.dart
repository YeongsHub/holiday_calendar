class ApiConstants {
  ApiConstants._();

  // OpenHolidays API
  static const String baseUrl = 'https://openholidaysapi.org';
  static const String countryCode = 'DE';
  static const String languageCode = 'DE';

  /// Get public holidays endpoint for a specific year and country (DE/AT/CH)
  static String publicHolidaysEndpoint(int year,
          {String country = countryCode}) =>
      '/PublicHolidays?countryIsoCode=$country&languageIsoCode=$languageCode&validFrom=$year-01-01&validTo=$year-12-31';

  /// Get school holidays endpoint for a specific year, subdivision and country
  static String schoolHolidaysEndpoint(int year, String subdivisionCode,
          {String country = countryCode}) =>
      '/SchoolHolidays?countryIsoCode=$country&languageIsoCode=$languageCode&validFrom=$year-01-01&validTo=$year-12-31&subdivisionCode=$subdivisionCode';

  /// Get subdivisions (federal states / cantons) endpoint
  static String subdivisionsEndpoint({String country = countryCode}) =>
      '/Subdivisions?countryIsoCode=$country';

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);

  /// Cache validity duration (24 hours)
  static const Duration cacheValidDuration = Duration(hours: 24);
}
