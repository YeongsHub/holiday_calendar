/// Countries supported by the app (OpenHolidays API coverage).
enum AppCountry {
  de(isoCode: 'DE', flag: '🇩🇪'),
  at(isoCode: 'AT', flag: '🇦🇹'),
  ch(isoCode: 'CH', flag: '🇨🇭');

  final String isoCode;
  final String flag;

  const AppCountry({required this.isoCode, required this.flag});

  /// Switzerland calls its subdivisions cantons, DE/AT Bundesländer.
  bool get usesCantons => this == AppCountry.ch;

  static AppCountry fromIsoCode(String? code) {
    return AppCountry.values.firstWhere(
      (c) => c.isoCode == code,
      orElse: () => AppCountry.de,
    );
  }
}
