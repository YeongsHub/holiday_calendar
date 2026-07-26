import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/domain/entities/federal_state.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';
import 'package:holiday_calendar/presentation/providers/premium_provider.dart';
import 'package:holiday_calendar/presentation/providers/repository_provider.dart';
import 'package:holiday_calendar/presentation/providers/year_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'second_region_provider.g.dart';

const String _secondRegionKey = 'grenzgaenger_second_region_code';

/// Grenzgänger mode: an optional second region (any DE/AT/CH subdivision)
/// whose holidays are overlaid on the calendar. Premium-only.
@riverpod
class SecondRegion extends _$SecondRegion {
  @override
  FederalState? build() {
    _loadSaved();
    return null;
  }

  Future<void> _loadSaved() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_secondRegionKey);
    if (code != null) {
      final saved = FederalState.byCode(code);
      if (saved != null) {
        state = saved;
      }
    }
  }

  Future<void> select(FederalState? region) async {
    state = region;
    final prefs = await SharedPreferences.getInstance();
    if (region != null) {
      await prefs.setString(_secondRegionKey, region.code);
    } else {
      await prefs.remove(_secondRegionKey);
    }
  }
}

/// Holidays of the second region for the selected year. Empty unless the
/// user is premium and has picked a second region.
@riverpod
Future<List<Holiday>> secondRegionHolidays(Ref ref) async {
  final isPremium = ref.watch(premiumStatusProvider).valueOrNull ?? false;
  final region = ref.watch(secondRegionProvider);
  if (!isPremium || region == null) return [];

  final year = ref.watch(selectedYearProvider);
  final countryCode = region.code.split('-').first;
  final repository = ref.watch(holidayRepositoryProvider);

  final result = await repository.getHolidays(year, countryCode: countryCode);
  return result.fold(
    // Grenzgänger overlay is a bonus layer — fail quietly, never block the UI.
    (failure) => [],
    (holidays) =>
        holidays.where((h) => h.isApplicableTo(region.code)).toList(),
  );
}

@riverpod
Map<DateTime, List<Holiday>> secondRegionHolidaysByDate(Ref ref) {
  final holidaysAsync = ref.watch(secondRegionHolidaysProvider);
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
