// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$holidaysByDateHash() => r'3e8e94015d132e1da407de4e05c37dd828cb2be0';

/// See also [holidaysByDate].
@ProviderFor(holidaysByDate)
final holidaysByDateProvider =
    AutoDisposeProvider<Map<DateTime, List<Holiday>>>.internal(
      holidaysByDate,
      name: r'holidaysByDateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$holidaysByDateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HolidaysByDateRef =
    AutoDisposeProviderRef<Map<DateTime, List<Holiday>>>;
String _$holidayNotifierHash() => r'2a4a5f1a3b207a1c306f4b48c84534532db9775b';

/// See also [HolidayNotifier].
@ProviderFor(HolidayNotifier)
final holidayNotifierProvider =
    AutoDisposeAsyncNotifierProvider<HolidayNotifier, List<Holiday>>.internal(
      HolidayNotifier.new,
      name: r'holidayNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$holidayNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$HolidayNotifier = AutoDisposeAsyncNotifier<List<Holiday>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
