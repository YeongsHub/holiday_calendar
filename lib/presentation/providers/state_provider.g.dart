// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$federalStatesHash() => r'dc65b5905cf2b644e58a7180bf1b3b64a3144f0d';

/// See also [federalStates].
@ProviderFor(federalStates)
final federalStatesProvider = AutoDisposeProvider<List<FederalState>>.internal(
  federalStates,
  name: r'federalStatesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$federalStatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FederalStatesRef = AutoDisposeProviderRef<List<FederalState>>;
String _$usedVacationDaysHash() => r'ca88830beaebd01ec0e1736b5ac29c61e98d77b7';

/// Counts weekdays (Mon–Fri) used across all vacations in the current year.
///
/// Copied from [usedVacationDays].
@ProviderFor(usedVacationDays)
final usedVacationDaysProvider = AutoDisposeProvider<int>.internal(
  usedVacationDays,
  name: r'usedVacationDaysProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$usedVacationDaysHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UsedVacationDaysRef = AutoDisposeProviderRef<int>;
String _$remainingVacationDaysHash() =>
    r'44dc1ccfe84a0bcc58d98ad932db2e9df4c68e43';

/// See also [remainingVacationDays].
@ProviderFor(remainingVacationDays)
final remainingVacationDaysProvider = AutoDisposeProvider<int>.internal(
  remainingVacationDays,
  name: r'remainingVacationDaysProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$remainingVacationDaysHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RemainingVacationDaysRef = AutoDisposeProviderRef<int>;
String _$selectedCountryHash() => r'81fb64750a792b0ed83fff180b519f021b90d901';

/// See also [SelectedCountry].
@ProviderFor(SelectedCountry)
final selectedCountryProvider =
    AutoDisposeNotifierProvider<SelectedCountry, AppCountry>.internal(
      SelectedCountry.new,
      name: r'selectedCountryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$selectedCountryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedCountry = AutoDisposeNotifier<AppCountry>;
String _$selectedFederalStateHash() =>
    r'eeac626089ff53da2be79be5f5e6c45b3108d5fd';

/// See also [SelectedFederalState].
@ProviderFor(SelectedFederalState)
final selectedFederalStateProvider =
    AutoDisposeNotifierProvider<SelectedFederalState, FederalState?>.internal(
      SelectedFederalState.new,
      name: r'selectedFederalStateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$selectedFederalStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedFederalState = AutoDisposeNotifier<FederalState?>;
String _$annualVacationDaysHash() =>
    r'd791c5e936fec2e477e23d3d79eac824e243c9ec';

/// See also [AnnualVacationDays].
@ProviderFor(AnnualVacationDays)
final annualVacationDaysProvider =
    AutoDisposeNotifierProvider<AnnualVacationDays, int>.internal(
      AnnualVacationDays.new,
      name: r'annualVacationDaysProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$annualVacationDaysHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AnnualVacationDays = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
