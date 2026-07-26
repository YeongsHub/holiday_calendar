// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'second_region_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$secondRegionHolidaysHash() =>
    r'2e198c7e4254fabd825d795c7cf8d07601c80325';

/// Holidays of the second region for the selected year. Empty unless the
/// user is premium and has picked a second region.
///
/// Copied from [secondRegionHolidays].
@ProviderFor(secondRegionHolidays)
final secondRegionHolidaysProvider =
    AutoDisposeFutureProvider<List<Holiday>>.internal(
      secondRegionHolidays,
      name: r'secondRegionHolidaysProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$secondRegionHolidaysHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SecondRegionHolidaysRef = AutoDisposeFutureProviderRef<List<Holiday>>;
String _$secondRegionHolidaysByDateHash() =>
    r'eff6e2e32d86fb3bfd41028196c4ac8a32c6ddd9';

/// See also [secondRegionHolidaysByDate].
@ProviderFor(secondRegionHolidaysByDate)
final secondRegionHolidaysByDateProvider =
    AutoDisposeProvider<Map<DateTime, List<Holiday>>>.internal(
      secondRegionHolidaysByDate,
      name: r'secondRegionHolidaysByDateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$secondRegionHolidaysByDateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SecondRegionHolidaysByDateRef =
    AutoDisposeProviderRef<Map<DateTime, List<Holiday>>>;
String _$secondRegionHash() => r'7be0a5ba251f144ccd6a23a00750600bb07e7013';

/// Grenzgänger mode: an optional second region (any DE/AT/CH subdivision)
/// whose holidays are overlaid on the calendar. Premium-only.
///
/// Copied from [SecondRegion].
@ProviderFor(SecondRegion)
final secondRegionProvider =
    AutoDisposeNotifierProvider<SecondRegion, FederalState?>.internal(
      SecondRegion.new,
      name: r'secondRegionProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$secondRegionHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SecondRegion = AutoDisposeNotifier<FederalState?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
