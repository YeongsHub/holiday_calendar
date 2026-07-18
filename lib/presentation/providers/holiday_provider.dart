import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';
import 'package:holiday_calendar/presentation/providers/repository_provider.dart';
import 'package:holiday_calendar/presentation/providers/state_provider.dart';
import 'package:holiday_calendar/presentation/providers/year_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'holiday_provider.g.dart';

@riverpod
class HolidayNotifier extends _$HolidayNotifier {
  @override
  Future<List<Holiday>> build() async {
    final year = ref.watch(selectedYearProvider);
    final country = ref.watch(selectedCountryProvider);
    final selectedState = ref.watch(selectedFederalStateProvider);

    final repository = ref.watch(holidayRepositoryProvider);
    final result =
        await repository.getHolidays(year, countryCode: country.isoCode);

    return result.fold(
      (failure) => throw Exception(failure.when(
        network: (_) =>
            'Keine Internetverbindung. Bitte überprüfe deine Verbindung und versuche es erneut.',
        server: (msg, code) =>
            'Serverfehler (${code ?? ''}). Bitte versuche es später erneut.',
        unknown: (_) =>
            'Ein unbekannter Fehler ist aufgetreten. Bitte versuche es erneut.',
      )),
      (holidays) {
        if (selectedState == null) {
          return holidays;
        }
        return holidays
            .where((h) => h.isApplicableTo(selectedState.code))
            .toList();
      },
    );
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

@riverpod
Map<DateTime, List<Holiday>> holidaysByDate(Ref ref) {
  final holidaysAsync = ref.watch(holidayNotifierProvider);

  return holidaysAsync.when(
    data: (holidays) {
      final map = <DateTime, List<Holiday>>{};
      for (final holiday in holidays) {
        final date = DateTime(
          holiday.date.year,
          holiday.date.month,
          holiday.date.day,
        );
        map.putIfAbsent(date, () => []).add(holiday);
      }
      return map;
    },
    loading: () => {},
    error: (_, _) => {},
  );
}
