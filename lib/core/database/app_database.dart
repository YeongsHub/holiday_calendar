import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

class HolidayTable extends Table {
  TextColumn get apiId => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get localName => text()();
  TextColumn get name => text()();
  TextColumn get countryCode => text()();
  BoolColumn get fixed => boolean().withDefault(const Constant(false))();
  BoolColumn get global => boolean().withDefault(const Constant(false))();
  TextColumn get counties => text().nullable()();
  TextColumn get types => text().nullable()();
  IntColumn get year => integer()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {apiId, year};
}

class SchoolHolidayTable extends Table {
  TextColumn get apiId => text()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  TextColumn get localName => text()();
  TextColumn get name => text()();
  TextColumn get subdivisionCode => text()();
  IntColumn get year => integer()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {apiId, year, subdivisionCode};
}

class VacationTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
}

@DriftDatabase(tables: [HolidayTable, SchoolHolidayTable, VacationTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 2) {
            await m.createTable(schoolHolidayTable);
          }
          if (from < 3) {
            await m.createTable(vacationTable);
          }
        },
      );

  // 특정 연도의 공휴일 조회
  Future<List<HolidayTableData>> getHolidaysByYear(int year) {
    return (select(holidayTable)..where((h) => h.year.equals(year))).get();
  }

  // 특정 연도+국가의 공휴일 조회
  Future<List<HolidayTableData>> getHolidaysByYearAndCountry(
      int year, String countryCode) {
    return (select(holidayTable)
          ..where((h) => h.year.equals(year) & h.countryCode.equals(countryCode)))
        .get();
  }

  // 특정 연도의 공휴일 삭제
  Future<int> deleteHolidaysByYear(int year) {
    return (delete(holidayTable)..where((h) => h.year.equals(year))).go();
  }

  // 특정 연도+국가의 공휴일 삭제
  Future<int> deleteHolidaysByYearAndCountry(int year, String countryCode) {
    return (delete(holidayTable)
          ..where((h) => h.year.equals(year) & h.countryCode.equals(countryCode)))
        .go();
  }

  // 공휴일 일괄 저장
  Future<void> insertHolidays(List<HolidayTableCompanion> holidays) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(holidayTable, holidays);
    });
  }

  // 캐시 유효성 확인 (24시간)
  Future<bool> isCacheValid(int year) async {
    final result = await (select(holidayTable)
          ..where((h) => h.year.equals(year))
          ..limit(1))
        .getSingleOrNull();

    if (result == null) return false;

    final cacheAge = DateTime.now().difference(result.cachedAt);
    return cacheAge.inHours < 24;
  }

  // 캐시 유효성 확인 (24시간, 국가별)
  Future<bool> isCacheValidForCountry(int year, String countryCode) async {
    final result = await (select(holidayTable)
          ..where((h) => h.year.equals(year) & h.countryCode.equals(countryCode))
          ..limit(1))
        .getSingleOrNull();

    if (result == null) return false;

    final cacheAge = DateTime.now().difference(result.cachedAt);
    return cacheAge.inHours < 24;
  }

  // 전체 공휴일 캐시 삭제
  Future<int> clearAllCache() {
    return delete(holidayTable).go();
  }

  // --- SchoolHoliday queries ---

  // 특정 연도+연방주의 학교 방학 조회
  Future<List<SchoolHolidayTableData>> getSchoolHolidaysByYearAndState(
      int year, String subdivisionCode) {
    return (select(schoolHolidayTable)
          ..where((s) =>
              s.year.equals(year) &
              s.subdivisionCode.equals(subdivisionCode)))
        .get();
  }

  // 특정 연도+연방주의 학교 방학 삭제
  Future<int> deleteSchoolHolidaysByYearAndState(
      int year, String subdivisionCode) {
    return (delete(schoolHolidayTable)
          ..where((s) =>
              s.year.equals(year) &
              s.subdivisionCode.equals(subdivisionCode)))
        .go();
  }

  // 학교 방학 일괄 저장
  Future<void> insertSchoolHolidays(
      List<SchoolHolidayTableCompanion> schoolHolidays) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(schoolHolidayTable, schoolHolidays);
    });
  }

  // 학교 방학 캐시 유효성 확인
  Future<bool> isSchoolHolidayCacheValid(
      int year, String subdivisionCode) async {
    final result = await (select(schoolHolidayTable)
          ..where((s) =>
              s.year.equals(year) &
              s.subdivisionCode.equals(subdivisionCode))
          ..limit(1))
        .getSingleOrNull();

    if (result == null) return false;

    final cacheAge = DateTime.now().difference(result.cachedAt);
    return cacheAge.inHours < 24;
  }

  // --- Vacation queries ---

  Stream<List<VacationTableData>> watchAllVacations() =>
      select(vacationTable).watch();

  Future<List<VacationTableData>> getAllVacations() =>
      select(vacationTable).get();

  Future<int> insertVacation(VacationTableCompanion vacation) =>
      into(vacationTable).insert(vacation);

  Future<bool> updateVacation(VacationTableCompanion vacation) =>
      update(vacationTable).replace(vacation);

  Future<int> deleteVacation(int id) =>
      (delete(vacationTable)..where((v) => v.id.equals(id))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'holiday_calendar.db'));
    return NativeDatabase.createInBackground(file);
  });
}
