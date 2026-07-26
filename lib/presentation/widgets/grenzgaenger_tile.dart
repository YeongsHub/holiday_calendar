import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/domain/entities/app_country.dart';
import 'package:holiday_calendar/domain/entities/federal_state.dart';
import 'package:holiday_calendar/l10n/app_localizations.dart';
import 'package:holiday_calendar/presentation/providers/premium_provider.dart';
import 'package:holiday_calendar/presentation/providers/second_region_provider.dart';
import 'package:holiday_calendar/presentation/widgets/premium_dialog.dart';

/// Settings tile for the premium Grenzgänger mode: pick a second region
/// (any DE/AT/CH subdivision) whose holidays are overlaid on the calendar.
class GrenzgaengerTile extends ConsumerWidget {
  const GrenzgaengerTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isPremium = ref.watch(premiumStatusProvider).valueOrNull ?? false;
    final secondRegion = ref.watch(secondRegionProvider);

    final subtitle = !isPremium
        ? '${l10n.removeAdsTitle} · Premium'
        : (secondRegion?.nameDE ?? l10n.offLabel);

    return ListTile(
      leading: const Icon(Icons.swap_horiz, color: Colors.teal),
      title: Row(
        children: [
          Flexible(child: Text(l10n.grenzgaengerMode)),
          if (!isPremium) ...[
            const SizedBox(width: 6),
            Icon(Icons.workspace_premium_rounded,
                size: 16, color: theme.colorScheme.primary),
          ],
        ],
      ),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        if (!isPremium) {
          PremiumDialog.show(context);
        } else {
          _showRegionPicker(context, ref);
        }
      },
    );
  }

  void _showRegionPicker(BuildContext context, WidgetRef ref) {
    final current = ref.read(secondRegionProvider);
    var pickerCountry = current != null
        ? AppCountry.fromIsoCode(current.code.split('-').first)
        : AppCountry.de;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        final l10n = AppLocalizations.of(ctx)!;
        final theme = Theme.of(ctx);
        return StatefulBuilder(
          builder: (ctx, setState) {
            final states = FederalState.forCountry(pickerCountry);
            return SafeArea(
              child: SizedBox(
                height: MediaQuery.of(ctx).size.height * 0.7,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        l10n.grenzgaengerMode,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    SegmentedButton<AppCountry>(
                      segments: const [
                        ButtonSegment(
                            value: AppCountry.de, label: Text('🇩🇪 DE')),
                        ButtonSegment(
                            value: AppCountry.at, label: Text('🇦🇹 AT')),
                        ButtonSegment(
                            value: AppCountry.ch, label: Text('🇨🇭 CH')),
                      ],
                      selected: {pickerCountry},
                      onSelectionChanged: (selection) =>
                          setState(() => pickerCountry = selection.first),
                    ),
                    const SizedBox(height: 8),
                    const Divider(height: 1),
                    Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                            leading: Icon(
                              current == null
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_unchecked,
                              color: current == null
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.outline,
                            ),
                            title: Text(l10n.offLabel),
                            onTap: () {
                              ref
                                  .read(secondRegionProvider.notifier)
                                  .select(null);
                              Navigator.pop(ctx);
                            },
                          ),
                          ...states.map(
                            (state) => ListTile(
                              leading: Icon(
                                current == state
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: current == state
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.outline,
                              ),
                              title: Text(state.nameDE),
                              onTap: () {
                                ref
                                    .read(secondRegionProvider.notifier)
                                    .select(state);
                                Navigator.pop(ctx);
                              },
                            ),
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
      },
    );
  }
}
