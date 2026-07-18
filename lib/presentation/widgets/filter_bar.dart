import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/core/services/analytics_service.dart';
import 'package:holiday_calendar/domain/entities/app_country.dart';
import 'package:holiday_calendar/domain/entities/federal_state.dart';
import 'package:holiday_calendar/l10n/app_localizations.dart';
import 'package:holiday_calendar/presentation/providers/month_provider.dart';
import 'package:holiday_calendar/presentation/providers/state_provider.dart';
import 'package:holiday_calendar/presentation/providers/year_provider.dart';
import 'package:intl/intl.dart';

class FilterBar extends ConsumerWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          _CountryButton(),
          const SizedBox(width: 8),
          Expanded(
            child: _StateDropdown(),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _YearMonthPicker(),
          ),
        ],
      ),
    );
  }
}

/// Compact country switcher (DE / AT / CH) shown as the current flag.
class _CountryButton extends ConsumerWidget {
  String _countryName(AppLocalizations l10n, AppCountry country) {
    switch (country) {
      case AppCountry.de:
        return l10n.countryGermany;
      case AppCountry.at:
        return l10n.countryAustria;
      case AppCountry.ch:
        return l10n.countrySwitzerland;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final country = ref.watch(selectedCountryProvider);
    final theme = Theme.of(context);

    return PopupMenuButton<AppCountry>(
      tooltip: l10n.country,
      initialValue: country,
      onSelected: (c) {
        ref.read(selectedCountryProvider.notifier).select(c);
        AnalyticsService().logBundeslandSelected(c.isoCode);
      },
      itemBuilder: (context) => AppCountry.values
          .map(
            (c) => PopupMenuItem(
              value: c,
              child: Row(
                children: [
                  Text(c.flag, style: const TextStyle(fontSize: 20)),
                  const SizedBox(width: 12),
                  Text(_countryName(l10n, c)),
                ],
              ),
            ),
          )
          .toList(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.outline),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(country.flag, style: const TextStyle(fontSize: 18)),
            Icon(
              Icons.arrow_drop_down,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}

class _StateDropdown extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selectedState = ref.watch(selectedFederalStateProvider);
    final states = ref.watch(federalStatesProvider);
    final country = ref.watch(selectedCountryProvider);
    final theme = Theme.of(context);

    final allLabel = country.usesCantons ? l10n.allCantons : l10n.allStates;

    return InkWell(
      onTap: () => _showStatePicker(context, ref, states, selectedState),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.outline),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                selectedState?.nameDE ?? allLabel,
                style: theme.textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }

  void _showStatePicker(
    BuildContext context,
    WidgetRef ref,
    List<FederalState> states,
    FederalState? selectedState,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        final country = ref.read(selectedCountryProvider);
        final allLabel = country.usesCantons ? l10n.allCantons : l10n.allStates;
        return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                l10n.selectState,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const Divider(),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: Text(allLabel),
                    leading: Icon(
                      selectedState == null
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      color: selectedState == null
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.outline,
                    ),
                    onTap: () {
                      ref.read(selectedFederalStateProvider.notifier).select(null);
                      Navigator.pop(context);
                    },
                  ),
                  ...states.map(
                    (state) => ListTile(
                      title: Text(state.nameDE),
                      leading: Icon(
                        selectedState == state
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        color: selectedState == state
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.outline,
                      ),
                      onTap: () {
                        ref.read(selectedFederalStateProvider.notifier).select(state);
                        AnalyticsService().logBundeslandSelected(state.code);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      },
    );
  }
}

class _YearMonthPicker extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedYear = ref.watch(selectedYearProvider);
    final selectedMonth = ref.watch(selectedMonthProvider);
    final theme = Theme.of(context);

    final monthName = DateFormat.MMMM(Localizations.localeOf(context).languageCode)
        .format(DateTime(2024, selectedMonth));

    return InkWell(
      onTap: () => _showYearMonthPicker(context, ref, selectedYear, selectedMonth),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.outline),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$selectedYear',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' · ',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              monthName,
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.arrow_drop_down,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }

  void _showYearMonthPicker(
    BuildContext context,
    WidgetRef ref,
    int selectedYear,
    int selectedMonth,
  ) {
    int tempYear = selectedYear;
    int tempMonth = selectedMonth;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        return StatefulBuilder(
        builder: (context, setState) => SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  l10n.selectYearAndMonth,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Divider(),
              SizedBox(
                height: 200,
                child: Row(
                  children: [
                    // Year Picker
                    Expanded(
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 50,
                        perspective: 0.005,
                        diameterRatio: 1.2,
                        physics: const FixedExtentScrollPhysics(),
                        controller: FixedExtentScrollController(
                          initialItem: tempYear - 2020,
                        ),
                        onSelectedItemChanged: (index) {
                          setState(() => tempYear = 2020 + index);
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 20,
                          builder: (context, index) {
                            final year = 2020 + index;
                            final isSelected = year == tempYear;
                            return Center(
                              child: Text(
                                '$year',
                                style: TextStyle(
                                  fontSize: isSelected ? 24 : 18,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  color: isSelected
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    // Month Picker
                    Expanded(
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 50,
                        perspective: 0.005,
                        diameterRatio: 1.2,
                        physics: const FixedExtentScrollPhysics(),
                        controller: FixedExtentScrollController(
                          initialItem: tempMonth - 1,
                        ),
                        onSelectedItemChanged: (index) {
                          setState(() => tempMonth = index + 1);
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 12,
                          builder: (context, index) {
                            final month = index + 1;
                            final monthName = DateFormat.MMMM(Localizations.localeOf(context).languageCode)
                                .format(DateTime(2024, month));
                            final isSelected = month == tempMonth;
                            return Center(
                              child: Text(
                                monthName,
                                style: TextStyle(
                                  fontSize: isSelected ? 20 : 16,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  color: isSelected
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(l10n.cancel),
                    ),
                    const SizedBox(width: 8),
                    FilledButton(
                      onPressed: () {
                        ref.read(selectedYearProvider.notifier).select(tempYear);
                        ref.read(selectedMonthProvider.notifier).select(tempMonth);
                        Navigator.pop(context);
                      },
                      child: Text(l10n.ok),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
      },
    );
  }
}
