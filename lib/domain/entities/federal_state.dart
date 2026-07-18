import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:holiday_calendar/domain/entities/app_country.dart';

part 'federal_state.freezed.dart';

@freezed
class FederalState with _$FederalState {
  const factory FederalState({
    required String code,
    required String nameDE,
    required String nameEN,
  }) = _FederalState;

  static const List<FederalState> all = [
    FederalState(code: 'DE-BW', nameDE: 'Baden-Württemberg', nameEN: 'Baden-Württemberg'),
    FederalState(code: 'DE-BY', nameDE: 'Bayern', nameEN: 'Bavaria'),
    FederalState(code: 'DE-BE', nameDE: 'Berlin', nameEN: 'Berlin'),
    FederalState(code: 'DE-BB', nameDE: 'Brandenburg', nameEN: 'Brandenburg'),
    FederalState(code: 'DE-HB', nameDE: 'Bremen', nameEN: 'Bremen'),
    FederalState(code: 'DE-HH', nameDE: 'Hamburg', nameEN: 'Hamburg'),
    FederalState(code: 'DE-HE', nameDE: 'Hessen', nameEN: 'Hesse'),
    FederalState(code: 'DE-MV', nameDE: 'Mecklenburg-Vorpommern', nameEN: 'Mecklenburg-Western Pomerania'),
    FederalState(code: 'DE-NI', nameDE: 'Niedersachsen', nameEN: 'Lower Saxony'),
    FederalState(code: 'DE-NW', nameDE: 'Nordrhein-Westfalen', nameEN: 'North Rhine-Westphalia'),
    FederalState(code: 'DE-RP', nameDE: 'Rheinland-Pfalz', nameEN: 'Rhineland-Palatinate'),
    FederalState(code: 'DE-SL', nameDE: 'Saarland', nameEN: 'Saarland'),
    FederalState(code: 'DE-SN', nameDE: 'Sachsen', nameEN: 'Saxony'),
    FederalState(code: 'DE-ST', nameDE: 'Sachsen-Anhalt', nameEN: 'Saxony-Anhalt'),
    FederalState(code: 'DE-SH', nameDE: 'Schleswig-Holstein', nameEN: 'Schleswig-Holstein'),
    FederalState(code: 'DE-TH', nameDE: 'Thüringen', nameEN: 'Thuringia'),
  ];

  /// Austrian Bundesländer (OpenHolidays subdivision codes).
  static const List<FederalState> austria = [
    FederalState(code: 'AT-BL', nameDE: 'Burgenland', nameEN: 'Burgenland'),
    FederalState(code: 'AT-KÄ', nameDE: 'Kärnten', nameEN: 'Carinthia'),
    FederalState(code: 'AT-NÖ', nameDE: 'Niederösterreich', nameEN: 'Lower Austria'),
    FederalState(code: 'AT-OÖ', nameDE: 'Oberösterreich', nameEN: 'Upper Austria'),
    FederalState(code: 'AT-SB', nameDE: 'Salzburg', nameEN: 'Salzburg'),
    FederalState(code: 'AT-SM', nameDE: 'Steiermark', nameEN: 'Styria'),
    FederalState(code: 'AT-TI', nameDE: 'Tirol', nameEN: 'Tyrol'),
    FederalState(code: 'AT-VA', nameDE: 'Vorarlberg', nameEN: 'Vorarlberg'),
    FederalState(code: 'AT-WI', nameDE: 'Wien', nameEN: 'Vienna'),
  ];

  /// Swiss cantons (OpenHolidays subdivision codes).
  static const List<FederalState> switzerland = [
    FederalState(code: 'CH-AG', nameDE: 'Aargau', nameEN: 'Aargau'),
    FederalState(code: 'CH-AR', nameDE: 'Appenzell Ausserrhoden', nameEN: 'Appenzell Ausserrhoden'),
    FederalState(code: 'CH-AI', nameDE: 'Appenzell Innerrhoden', nameEN: 'Appenzell Innerrhoden'),
    FederalState(code: 'CH-BL', nameDE: 'Basel-Landschaft', nameEN: 'Basel-Landschaft'),
    FederalState(code: 'CH-BS', nameDE: 'Basel-Stadt', nameEN: 'Basel-Stadt'),
    FederalState(code: 'CH-BE', nameDE: 'Bern', nameEN: 'Bern'),
    FederalState(code: 'CH-FR', nameDE: 'Freiburg', nameEN: 'Fribourg'),
    FederalState(code: 'CH-GE', nameDE: 'Genf', nameEN: 'Geneva'),
    FederalState(code: 'CH-GL', nameDE: 'Glarus', nameEN: 'Glarus'),
    FederalState(code: 'CH-GR', nameDE: 'Graubünden', nameEN: 'Grisons'),
    FederalState(code: 'CH-JU', nameDE: 'Jura', nameEN: 'Jura'),
    FederalState(code: 'CH-LU', nameDE: 'Luzern', nameEN: 'Lucerne'),
    FederalState(code: 'CH-NE', nameDE: 'Neuenburg', nameEN: 'Neuchâtel'),
    FederalState(code: 'CH-NW', nameDE: 'Nidwalden', nameEN: 'Nidwalden'),
    FederalState(code: 'CH-OW', nameDE: 'Obwalden', nameEN: 'Obwalden'),
    FederalState(code: 'CH-SH', nameDE: 'Schaffhausen', nameEN: 'Schaffhausen'),
    FederalState(code: 'CH-SZ', nameDE: 'Schwyz', nameEN: 'Schwyz'),
    FederalState(code: 'CH-SO', nameDE: 'Solothurn', nameEN: 'Solothurn'),
    FederalState(code: 'CH-SG', nameDE: 'St. Gallen', nameEN: 'St. Gallen'),
    FederalState(code: 'CH-TI', nameDE: 'Tessin', nameEN: 'Ticino'),
    FederalState(code: 'CH-TG', nameDE: 'Thurgau', nameEN: 'Thurgau'),
    FederalState(code: 'CH-UR', nameDE: 'Uri', nameEN: 'Uri'),
    FederalState(code: 'CH-VD', nameDE: 'Waadt', nameEN: 'Vaud'),
    FederalState(code: 'CH-VS', nameDE: 'Wallis', nameEN: 'Valais'),
    FederalState(code: 'CH-ZG', nameDE: 'Zug', nameEN: 'Zug'),
    FederalState(code: 'CH-ZH', nameDE: 'Zürich', nameEN: 'Zürich'),
  ];

  static List<FederalState> forCountry(AppCountry country) {
    switch (country) {
      case AppCountry.de:
        return all;
      case AppCountry.at:
        return austria;
      case AppCountry.ch:
        return switzerland;
    }
  }

  /// Find a state by its subdivision code across all supported countries.
  static FederalState? byCode(String code) {
    for (final list in [all, austria, switzerland]) {
      for (final s in list) {
        if (s.code == code) return s;
      }
    }
    return null;
  }
}
