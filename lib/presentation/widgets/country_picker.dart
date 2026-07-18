import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/domain/entities/app_country.dart';
import 'package:holiday_calendar/l10n/app_localizations.dart';
import 'package:holiday_calendar/presentation/providers/state_provider.dart';

String countryDisplayName(AppLocalizations l10n, AppCountry country) {
  switch (country) {
    case AppCountry.de:
      return l10n.countryGermany;
    case AppCountry.at:
      return l10n.countryAustria;
    case AppCountry.ch:
      return l10n.countrySwitzerland;
  }
}

/// A settings tile that opens the country picker (DE/AT/CH). Changing the
/// country reloads holidays and clears a mismatched Bundesland/canton filter.
class CountryPickerTile extends ConsumerWidget {
  const CountryPickerTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final country = ref.watch(selectedCountryProvider);
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(Icons.public, color: theme.colorScheme.primary),
      title: Text(l10n.country),
      subtitle: Text('${country.flag} ${countryDisplayName(l10n, country)}'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => _showCountryDialog(context, ref),
    );
  }

  Future<void> _showCountryDialog(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final current = ref.read(selectedCountryProvider);

    await showDialog<void>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(l10n.country),
          children: [
            RadioGroup<AppCountry>(
              groupValue: current,
              onChanged: (value) {
                if (value != null) {
                  ref.read(selectedCountryProvider.notifier).select(value);
                }
                Navigator.pop(context);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final country in AppCountry.values)
                    RadioListTile<AppCountry>(
                      value: country,
                      title: Text(
                        '${country.flag} ${countryDisplayName(l10n, country)}',
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
