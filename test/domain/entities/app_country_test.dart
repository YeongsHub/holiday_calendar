import 'package:flutter_test/flutter_test.dart';
import 'package:holiday_calendar/domain/entities/app_country.dart';
import 'package:holiday_calendar/domain/entities/federal_state.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';

void main() {
  group('AppCountry', () {
    test('fromIsoCode resolves all supported countries', () {
      expect(AppCountry.fromIsoCode('DE'), AppCountry.de);
      expect(AppCountry.fromIsoCode('AT'), AppCountry.at);
      expect(AppCountry.fromIsoCode('CH'), AppCountry.ch);
    });

    test('fromIsoCode falls back to Germany for unknown codes', () {
      expect(AppCountry.fromIsoCode(null), AppCountry.de);
      expect(AppCountry.fromIsoCode('FR'), AppCountry.de);
    });

    test('only Switzerland uses cantons', () {
      expect(AppCountry.ch.usesCantons, isTrue);
      expect(AppCountry.de.usesCantons, isFalse);
      expect(AppCountry.at.usesCantons, isFalse);
    });
  });

  group('FederalState.forCountry', () {
    test('returns 16 German states, 9 Austrian states, 26 Swiss cantons', () {
      expect(FederalState.forCountry(AppCountry.de).length, 16);
      expect(FederalState.forCountry(AppCountry.at).length, 9);
      expect(FederalState.forCountry(AppCountry.ch).length, 26);
    });

    test('subdivision codes carry the country prefix', () {
      for (final country in AppCountry.values) {
        for (final s in FederalState.forCountry(country)) {
          expect(s.code, startsWith('${country.isoCode}-'));
        }
      }
    });

    test('byCode finds states across countries', () {
      expect(FederalState.byCode('DE-BY')?.nameDE, 'Bayern');
      expect(FederalState.byCode('AT-WI')?.nameDE, 'Wien');
      expect(FederalState.byCode('CH-ZH')?.nameDE, 'Zürich');
      expect(FederalState.byCode('XX-YY'), isNull);
    });
  });

  group('Holiday.isApplicableTo with Swiss sub-canton codes', () {
    Holiday regionalHoliday(List<String> counties) => Holiday(
          date: DateTime(2026, 1, 2),
          localName: 'Berchtoldstag',
          name: 'Berchtold Day',
          countryCode: 'CH',
          fixed: true,
          global: false,
          counties: counties,
        );

    test('matches exact canton code', () {
      expect(regionalHoliday(['CH-ZH']).isApplicableTo('CH-ZH'), isTrue);
    });

    test('matches sub-canton district codes by canton prefix', () {
      // The API lists districts like CH-FR-LA-RI for canton Fribourg.
      expect(
        regionalHoliday(['CH-FR-LA-RI', 'CH-AG-ZZ']).isApplicableTo('CH-FR'),
        isTrue,
      );
      expect(
        regionalHoliday(['CH-FR-LA-RI', 'CH-AG-ZZ']).isApplicableTo('CH-AG'),
        isTrue,
      );
    });

    test('does not match a different canton', () {
      expect(
        regionalHoliday(['CH-FR-LA-RI']).isApplicableTo('CH-ZH'),
        isFalse,
      );
    });

    test('does not treat a canton as prefix of an unrelated code', () {
      // CH-A must not match CH-AG.
      expect(regionalHoliday(['CH-AG']).isApplicableTo('CH-A'), isFalse);
    });
  });
}
