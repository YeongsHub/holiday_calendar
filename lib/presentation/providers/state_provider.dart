import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/domain/entities/app_country.dart';
import 'package:holiday_calendar/domain/entities/federal_state.dart';
import 'package:holiday_calendar/presentation/providers/db_vacation_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'state_provider.g.dart';

const String _selectedStateKey = 'selected_federal_state_code';
const String _selectedCountryKey = 'selected_country_iso_code';

@riverpod
class SelectedCountry extends _$SelectedCountry {
  @override
  AppCountry build() {
    _loadSavedCountry();
    return AppCountry.de;
  }

  Future<void> _loadSavedCountry() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_selectedCountryKey);
    if (code != null) {
      state = AppCountry.fromIsoCode(code);
    }
  }

  Future<void> select(AppCountry country) async {
    if (state == country) return;
    state = country;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_selectedCountryKey, country.isoCode);

    // A Bundesland/canton from the previous country makes no sense for the
    // new one — reset the subdivision filter.
    final selectedState = ref.read(selectedFederalStateProvider);
    if (selectedState != null &&
        !selectedState.code.startsWith('${country.isoCode}-')) {
      await ref.read(selectedFederalStateProvider.notifier).clear();
    }
  }
}

@riverpod
class SelectedFederalState extends _$SelectedFederalState {
  @override
  FederalState? build() {
    _loadSavedState();
    return null;
  }

  Future<void> _loadSavedState() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_selectedStateKey);
    if (code != null) {
      final saved = FederalState.byCode(code);
      if (saved != null) {
        state = saved;
      }
    }
  }

  Future<void> select(FederalState? federalState) async {
    state = federalState;
    final prefs = await SharedPreferences.getInstance();
    if (federalState != null) {
      await prefs.setString(_selectedStateKey, federalState.code);
    } else {
      await prefs.remove(_selectedStateKey);
    }
  }

  Future<void> clear() async {
    state = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_selectedStateKey);
  }
}

@riverpod
List<FederalState> federalStates(Ref ref) {
  final country = ref.watch(selectedCountryProvider);
  return FederalState.forCountry(country);
}

// Annual vacation days provider (persisted via SharedPreferences)
@riverpod
class AnnualVacationDays extends _$AnnualVacationDays {
  static const _key = 'annual_vacation_days';

  @override
  int build() {
    _load();
    return 30; // default
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getInt(_key) ?? 30;
  }

  Future<void> set(int days) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, days);
    state = days;
  }
}

/// Counts weekdays (Mon–Fri) used across all vacations in the current year.
@riverpod
int usedVacationDays(Ref ref) {
  final vacations = ref.watch(dbVacationsProvider).valueOrNull ?? [];
  final currentYear = DateTime.now().year;
  int total = 0;
  for (final v in vacations) {
    var day = DateTime(v.startDate.year, v.startDate.month, v.startDate.day);
    final end = DateTime(v.endDate.year, v.endDate.month, v.endDate.day);
    while (!day.isAfter(end)) {
      if (day.year == currentYear &&
          day.weekday != DateTime.saturday &&
          day.weekday != DateTime.sunday) {
        total++;
      }
      day = day.add(const Duration(days: 1));
    }
  }
  return total;
}

@riverpod
int remainingVacationDays(Ref ref) {
  final total = ref.watch(annualVacationDaysProvider);
  final used = ref.watch(usedVacationDaysProvider);
  return (total - used).clamp(0, total);
}
