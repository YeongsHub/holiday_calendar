import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/core/services/notification_service.dart';
import 'package:holiday_calendar/core/services/widget_service.dart';
import 'package:holiday_calendar/l10n/app_localizations.dart';
import 'package:holiday_calendar/presentation/providers/db_vacation_provider.dart';
import 'package:holiday_calendar/presentation/providers/holiday_provider.dart';
import 'package:holiday_calendar/presentation/screens/bridge_day_screen.dart';
import 'package:holiday_calendar/presentation/screens/notification_settings_screen.dart';
import 'package:holiday_calendar/presentation/screens/year_overview_screen.dart';
import 'package:holiday_calendar/presentation/widgets/ads/banner_ad_widget.dart';
import 'package:holiday_calendar/presentation/widgets/ads/native_ad_widget.dart';
import 'package:holiday_calendar/presentation/widgets/bridge_day_preview.dart';
import 'package:holiday_calendar/presentation/widgets/calendar/holiday_calendar.dart';
import 'package:holiday_calendar/presentation/widgets/common/error_widget.dart';
import 'package:holiday_calendar/presentation/widgets/common/loading_shimmer.dart';
import 'package:holiday_calendar/presentation/providers/premium_provider.dart';
import 'package:holiday_calendar/presentation/widgets/filter_bar.dart';
import 'package:holiday_calendar/presentation/widgets/premium_dialog.dart';
import 'package:holiday_calendar/presentation/widgets/vacation_efficiency_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _showDisclaimerDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.aboutApp),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.importantInfoHeader,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(l10n.disclaimerBody),
              const SizedBox(height: 16),
              Text(
                l10n.dataSource,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(l10n.dataSourceBody),
              const SizedBox(height: 8),
              _SourceLink(
                label: l10n.sourceBmiLabel,
                url: 'https://www.bmi.bund.de/DE/themen/verfassung/staatliche-symbole/nationale-feiertage/nationale-feiertage-node.html',
              ),
              const SizedBox(height: 8),
              _SourceLink(
                label: l10n.sourceAustriaLabel,
                url: 'https://www.oesterreich.gv.at',
              ),
              const SizedBox(height: 8),
              _SourceLink(
                label: l10n.sourceSwitzerlandLabel,
                url: 'https://www.ch.ch',
              ),
              const SizedBox(height: 16),
              Text(
                l10n.technicalImplementation,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(l10n.technicalImplementationBody),
              const SizedBox(height: 8),
              _SourceLink(
                label: l10n.sourceOpenHolidaysLabel,
                url: 'https://www.openholidaysapi.org/en/',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => launchUrl(
              Uri.parse('https://gridnflow.github.io/privacy-policy.html'),
              mode: LaunchMode.externalApplication,
            ),
            child: Text(l10n.privacyPolicy),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.close),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final holidaysAsync = ref.watch(holidayNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.holidays),
        centerTitle: true,
        leadingWidth: 96,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.calendar_view_month),
              tooltip: l10n.yearOverview,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const YearOverviewScreen()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.beach_access),
              tooltip: l10n.bridgeDays,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const BridgeDayScreen()),
                );
              },
            ),
          ],
        ),
        actions: [
          if (!(ref.watch(premiumStatusProvider).valueOrNull ?? false))
            IconButton(
              icon: const Icon(Icons.workspace_premium_outlined),
              tooltip: l10n.removeAdsTitle,
              onPressed: () => PremiumDialog.show(context),
            ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            tooltip: l10n.notifications,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const NotificationSettingsScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: l10n.aboutApp,
            onPressed: () => _showDisclaimerDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          const FilterBar(),
          Expanded(
            child: holidaysAsync.when(
              data: (holidays) {
                WidgetService.updateNextHoliday(holidays);
                // Refresh recurring re-engagement notifications from fresh
                // data every time the home screen loads. Each sub-scheduler
                // self-gates on its enabled flag, so this is a no-op when the
                // user has all notification types turned off.
                NotificationService().refreshScheduledNotifications(holidays);
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const HolidayCalendar(),
                      const _NextHolidayDDayCard(),
                      const _NextVacationDDayCard(),
                      const Divider(height: 1),
                      const NativeAdWidget(),
                      // Brückentage Preview (horizontal scrolling cards)
                      const BridgeDayPreview(),
                      const VacationEfficiencyWidget(),
                      const SizedBox(height: 8),
                    ],
                  ),
                );
              },
              loading: () => const CalendarLoadingShimmer(),
              error: (error, _) => AppErrorWidget(
                message: error.toString(),
                onRetry: () {
                  ref.read(holidayNotifierProvider.notifier).refresh();
                },
              ),
            ),
          ),
          const AdBannerContainer(),
        ],
      ),
    );
  }
}

class _NextHolidayDDayCard extends ConsumerWidget {
  const _NextHolidayDDayCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final holidaysAsync = ref.watch(holidayNotifierProvider);
    final holidays = holidaysAsync.valueOrNull ?? [];

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final upcoming = holidays
        .where((h) => !DateTime(h.date.year, h.date.month, h.date.day).isBefore(today))
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));

    if (upcoming.isEmpty) return const SizedBox.shrink();

    // If today is a holiday (D-0), skip to the next upcoming one
    final next = upcoming.first;
    final firstDate = DateTime(next.date.year, next.date.month, next.date.day);
    final isToday = firstDate == today;
    final display = isToday && upcoming.length > 1 ? upcoming[1] : next;

    final nextDate = DateTime(display.date.year, display.date.month, display.date.day);
    final daysUntil = nextDate.difference(today).inDays;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  l10n.dDayLabel(daysUntil),
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    display.displayName(Localizations.localeOf(context).languageCode),
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    daysUntil == 1
                        ? l10n.tomorrowIsHoliday
                        : l10n.daysRemaining(daysUntil),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NextVacationDDayCard extends ConsumerWidget {
  const _NextVacationDDayCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final nextVacation = ref.watch(nextVacationProvider);

    if (nextVacation == null) return const SizedBox.shrink();

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final startDate = DateTime(
      nextVacation.startDate.year,
      nextVacation.startDate.month,
      nextVacation.startDate.day,
    );

    final daysUntil = startDate.difference(today).inDays;

    final theme = Theme.of(context);

    final dDayLabel = l10n.dDayLabel(daysUntil);
    final subtitleLabel = daysUntil == 1
        ? l10n.tomorrowVacationStarts
        : l10n.daysRemaining(daysUntil);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  dDayLabel,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: theme.colorScheme.onSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nextVacation.title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitleLabel,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSecondaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SourceLink extends StatelessWidget {
  const _SourceLink({required this.label, required this.url});

  final String label;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
        child: Text(
          label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
