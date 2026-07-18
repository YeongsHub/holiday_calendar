// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_holiday_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$schoolHolidaysByDateHash() =>
    r'4204611c46b49ef8bece3f8edb58b6f7ae02c0ac';

/// Map of dates that fall within school holidays
///
/// Copied from [schoolHolidaysByDate].
@ProviderFor(schoolHolidaysByDate)
final schoolHolidaysByDateProvider =
    AutoDisposeProvider<Map<DateTime, SchoolHoliday>>.internal(
      schoolHolidaysByDate,
      name: r'schoolHolidaysByDateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$schoolHolidaysByDateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SchoolHolidaysByDateRef =
    AutoDisposeProviderRef<Map<DateTime, SchoolHoliday>>;
String _$showSchoolHolidaysHash() =>
    r'd9b8666a5fc76c98e39296639a7c4f0acf7634d7';

/// See also [ShowSchoolHolidays].
@ProviderFor(ShowSchoolHolidays)
final showSchoolHolidaysProvider =
    AutoDisposeNotifierProvider<ShowSchoolHolidays, bool>.internal(
      ShowSchoolHolidays.new,
      name: r'showSchoolHolidaysProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$showSchoolHolidaysHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ShowSchoolHolidays = AutoDisposeNotifier<bool>;
String _$schoolHolidayNotifierHash() =>
    r'1fffa7af484f1086092e1382df4b2b1e84344e7e';

/// See also [SchoolHolidayNotifier].
@ProviderFor(SchoolHolidayNotifier)
final schoolHolidayNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      SchoolHolidayNotifier,
      List<SchoolHoliday>
    >.internal(
      SchoolHolidayNotifier.new,
      name: r'schoolHolidayNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$schoolHolidayNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SchoolHolidayNotifier = AutoDisposeAsyncNotifier<List<SchoolHoliday>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
