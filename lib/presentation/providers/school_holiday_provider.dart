import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/core/database/app_database.dart';
import 'package:holiday_calendar/domain/entities/school_holiday.dart';
import 'package:holiday_calendar/presentation/providers/dio_provider.dart';
import 'package:holiday_calendar/presentation/providers/repository_provider.dart';
import 'package:holiday_calendar/presentation/providers/state_provider.dart';
import 'package:holiday_calendar/presentation/providers/year_provider.dart';
import 'package:holiday_calendar/data/datasources/holiday_remote_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'school_holiday_provider.g.dart';

const String _showSchoolHolidaysKey = 'show_school_holidays';

@riverpod
class ShowSchoolHolidays extends _$ShowSchoolHolidays {
  @override
  bool build() {
    _loadSetting();
    return false;
  }

  Future<void> _loadSetting() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getBool(_showSchoolHolidaysKey);
    if (saved != null) {
      state = saved;
    }
  }

  Future<void> toggle(bool value) async {
    state = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_showSchoolHolidaysKey, value);
  }
}

@riverpod
class SchoolHolidayNotifier extends _$SchoolHolidayNotifier {
  @override
  Future<List<SchoolHoliday>> build() async {
    final showSchoolHolidays = ref.watch(showSchoolHolidaysProvider);
    if (!showSchoolHolidays) return [];

    final selectedState = ref.watch(selectedFederalStateProvider);
    if (selectedState == null) return [];

    final year = ref.watch(selectedYearProvider);
    final database = ref.watch(appDatabaseProvider);

    // Always fetch fresh from API; use cache only as offline fallback
    try {
      final remoteDataSource =
          HolidayRemoteDataSourceImpl(dio: ref.watch(dioProvider));
      // Derive the country from the subdivision code (e.g. "AT-WI" → "AT")
      // so school holidays follow the selected state's country.
      final countryCode = selectedState.code.split('-').first;
      final models = await remoteDataSource.getSchoolHolidays(
          year, selectedState.code,
          countryCode: countryCode);

      final entities = models.map((m) {
        final localName = m.name
            .firstWhere((n) => n.language == 'DE', orElse: () => m.name.first)
            .text;
        final englishName = m.name
            .firstWhere((n) => n.language == 'EN', orElse: () => m.name.first)
            .text;

        return SchoolHoliday(
          startDate: DateTime.parse(m.startDate),
          endDate: DateTime.parse(m.endDate),
          localName: localName,
          name: englishName,
          subdivisionCode: selectedState.code,
        );
      }).toList();

      // Update cache
      await database.deleteSchoolHolidaysByYearAndState(
          year, selectedState.code);
      final companions = entities
          .map((e) => SchoolHolidayTableCompanion(
                apiId: Value(
                    '${e.startDate.toIso8601String()}_${e.localName}_${e.subdivisionCode}'),
                startDate: Value(e.startDate),
                endDate: Value(e.endDate),
                localName: Value(e.localName),
                name: Value(e.name),
                subdivisionCode: Value(e.subdivisionCode),
                year: Value(year),
                cachedAt: Value(DateTime.now()),
              ))
          .toList();
      await database.insertSchoolHolidays(companions);

      return entities;
    } catch (_) {
      // Offline fallback to cache
      final cached = await database.getSchoolHolidaysByYearAndState(
          year, selectedState.code);
      return cached.map(_mapRowToEntity).toList();
    }
  }

  SchoolHoliday _mapRowToEntity(SchoolHolidayTableData row) {
    return SchoolHoliday(
      startDate: row.startDate,
      endDate: row.endDate,
      localName: row.localName,
      name: row.name,
      subdivisionCode: row.subdivisionCode,
    );
  }
}

/// Map of dates that fall within school holidays
@riverpod
Map<DateTime, SchoolHoliday> schoolHolidaysByDate(Ref ref) {
  final schoolHolidaysAsync = ref.watch(schoolHolidayNotifierProvider);

  return schoolHolidaysAsync.when(
    data: (schoolHolidays) {
      final map = <DateTime, SchoolHoliday>{};
      for (final sh in schoolHolidays) {
        var current = DateTime(
            sh.startDate.year, sh.startDate.month, sh.startDate.day);
        final end =
            DateTime(sh.endDate.year, sh.endDate.month, sh.endDate.day);
        while (!current.isAfter(end)) {
          map[current] = sh;
          current = current.add(const Duration(days: 1));
        }
      }
      return map;
    },
    loading: () => {},
    error: (_, _) => {},
  );
}
