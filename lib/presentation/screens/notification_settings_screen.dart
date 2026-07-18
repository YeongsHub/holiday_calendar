import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/l10n/app_localizations.dart';
import 'package:holiday_calendar/presentation/providers/notification_provider.dart';
import 'package:holiday_calendar/presentation/providers/school_holiday_provider.dart';
import 'package:holiday_calendar/presentation/widgets/country_picker.dart';
import 'package:holiday_calendar/presentation/widgets/language_picker.dart';

/// Screen for configuring Brückentage notification settings
class NotificationSettingsScreen extends ConsumerWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final settingsAsync = ref.watch(notificationSettingsProvider);
    final notificationsSupported = ref.watch(notificationsSupportedProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.notifications),
        centerTitle: true,
      ),
      body: settingsAsync.when(
        data: (settings) => ListView(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
              child: Row(
                children: [
                  Icon(
                    Icons.notifications_active,
                    size: 48,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.bridgeDayReminders,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          l10n.notificationHeaderSubtitle,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            if (!notificationsSupported) ...[
              const SizedBox(height: 16),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: theme.colorScheme.errorContainer,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.warning_amber,
                        color: theme.colorScheme.onErrorContainer,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          l10n.notificationsNotSupported,
                          style: TextStyle(
                            color: theme.colorScheme.onErrorContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],

            const SizedBox(height: 16),

            // Enable notifications toggle
            SwitchListTile(
              title: Text(l10n.bridgeDayNotifications),
              subtitle: Text(l10n.bridgeDayNotificationsSubtitle),
              value: settings.brueckentagEnabled,
              onChanged: notificationsSupported
                  ? (value) {
                      ref
                          .read(notificationSettingsProvider.notifier)
                          .setBrueckentagEnabled(value);
                    }
                  : null,
              secondary: Icon(
                settings.brueckentagEnabled
                    ? Icons.notifications_active
                    : Icons.notifications_off_outlined,
                color: settings.brueckentagEnabled
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outline,
              ),
            ),

            const Divider(),

            // Holiday reminders toggle (D-7 / D-1)
            SwitchListTile(
              title: Text(l10n.holidayReminders),
              subtitle: Text(l10n.holidayRemindersSubtitle),
              value: settings.holidayRemindersEnabled,
              onChanged: notificationsSupported
                  ? (value) {
                      ref
                          .read(notificationSettingsProvider.notifier)
                          .setHolidayRemindersEnabled(value);
                    }
                  : null,
              secondary: Icon(
                settings.holidayRemindersEnabled
                    ? Icons.event_available
                    : Icons.event_outlined,
                color: settings.holidayRemindersEnabled
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outline,
              ),
            ),

            const Divider(),

            // Reminder days selector
            ListTile(
              enabled: settings.brueckentagEnabled,
              leading: Icon(
                Icons.schedule,
                color: settings.brueckentagEnabled
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outline,
              ),
              title: Text(l10n.remindBefore),
              subtitle: Text(
                l10n.daysBefore(settings.reminderDaysBefore),
                style: TextStyle(
                  color: settings.brueckentagEnabled
                      ? theme.colorScheme.primary
                      : theme.colorScheme.outline,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: settings.brueckentagEnabled
                  ? const Icon(Icons.chevron_right)
                  : null,
              onTap: settings.brueckentagEnabled
                  ? () => _showReminderDaysDialog(context, ref, settings)
                  : null,
            ),

            const Divider(),

            // Monthly summary toggle
            SwitchListTile(
              title: Text(l10n.monthlySummary),
              subtitle: Text(l10n.monthlySummarySubtitle),
              value: settings.monthlySummaryEnabled,
              onChanged: notificationsSupported
                  ? (value) {
                      ref
                          .read(notificationSettingsProvider.notifier)
                          .setMonthlySummaryEnabled(value);
                    }
                  : null,
              secondary: Icon(
                Icons.calendar_month_outlined,
                color: settings.monthlySummaryEnabled
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outline,
              ),
            ),

            const Divider(),

            // Schulferien toggle
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                l10n.calendar,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            SwitchListTile(
              title: Text(l10n.showSchoolHolidays),
              subtitle: Text(l10n.showSchoolHolidaysSubtitle),
              value: ref.watch(showSchoolHolidaysProvider),
              onChanged: (value) {
                ref.read(showSchoolHolidaysProvider.notifier).toggle(value);
              },
              secondary: Icon(
                Icons.school_outlined,
                color: ref.watch(showSchoolHolidaysProvider)
                    ? theme.colorScheme.secondary
                    : theme.colorScheme.outline,
              ),
            ),

            const Divider(),

            // Country section
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                l10n.country,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            const CountryPickerTile(),

            const Divider(),

            // Language section
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                l10n.language,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            const LanguagePickerTile(),

            const Divider(),

            // Info section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.howItWorks,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildInfoItem(
                    context,
                    Icons.auto_awesome,
                    l10n.autoDetectionTitle,
                    l10n.autoDetectionBody,
                  ),
                  const SizedBox(height: 8),
                  _buildInfoItem(
                    context,
                    Icons.notification_add,
                    l10n.timelyReminderTitle,
                    l10n.timelyReminderBody,
                  ),
                  const SizedBox(height: 8),
                  _buildInfoItem(
                    context,
                    Icons.beach_access,
                    l10n.moreVacationTitle,
                    l10n.moreVacationBody,
                  ),
                ],
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 48,
                color: theme.colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                l10n.errorLoadingSettings,
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => ref.invalidate(notificationSettingsProvider),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context,
    IconData icon,
    String title,
    String description,
  ) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                description,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showReminderDaysDialog(
    BuildContext context,
    WidgetRef ref,
    NotificationSettingsData settings,
  ) {
    final options = [3, 5, 7, 14, 21, 30];

    showDialog(
      context: context,
      builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        return AlertDialog(
        title: Text(l10n.remindBefore),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: options.map((days) {
            final isSelected = settings.reminderDaysBefore == days;
            return ListTile(
              leading: Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outline,
              ),
              title: Text(l10n.daysCount(days)),
              onTap: () {
                ref
                    .read(notificationSettingsProvider.notifier)
                    .setReminderDaysBefore(days);
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
        ],
        );
      },
    );
  }
}
