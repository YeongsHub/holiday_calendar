import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:holiday_calendar/core/services/analytics_service.dart';
import 'package:holiday_calendar/core/services/localization_helper.dart';
import 'package:holiday_calendar/l10n/app_localizations.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;

/// Global navigator key for notification deep linking
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;

    // Initialize timezone
    tz_data.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Europe/Berlin'));

    // Android settings
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

    const initSettings = InitializationSettings(
      android: androidSettings,
    );

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );

    _isInitialized = true;
  }

  void _onNotificationTap(NotificationResponse response) {
    final payload = response.payload;
    if (kDebugMode) {
      debugPrint('Notification tapped: $payload');
    }
    // Attribute the re-engagement channel. Payloads look like
    // "holiday_d7", "monthly_summary", "brueckentag_<iso-date>", etc.;
    // collapse to the channel type before the first "_<date>".
    final type = _payloadType(payload);
    AnalyticsService().logNotificationOpen(type: type);
    AnalyticsService().logAppOpen(source: 'notification');
    // Deep link: navigate to the route registered in the app
    navigatorKey.currentState?.pushNamed('/bridge-days');
  }

  /// Normalise a notification payload into a stable channel type for
  /// analytics. `brueckentag_2026-05-01` → `brueckentag`; everything else is
  /// passed through unchanged.
  String _payloadType(String? payload) {
    if (payload == null || payload.isEmpty) return 'unknown';
    if (payload.startsWith('brueckentag_')) return 'brueckentag';
    return payload;
  }

  /// Request notification permissions (Android 13+)
  Future<bool> requestPermissions() async {
    final android = _notifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    bool granted = true;

    if (android != null) {
      granted = await android.requestNotificationsPermission() ?? false;
    }

    return granted;
  }

  /// Schedule a Brückentage reminder notification
  Future<void> scheduleBrueckentagReminder({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? payload,
  }) async {
    final (:l10n, languageCode: _) = await LocalizationHelper.current();
    final androidDetails = AndroidNotificationDetails(
      'brueckentage_channel',
      l10n.notifChannelName,
      channelDescription: l10n.notifChannelDescription,
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );

    final details = NotificationDetails(
      android: androidDetails,
    );

    await _notifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      details,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: payload,
    );
  }

  // Onboarding notification IDs (reserved range: 9001-9003)
  static const int _onboardingD1Id = 9001;
  static const int _onboardingD3Id = 9002;
  static const int _onboardingD7Id = 9003;

  /// Schedule the onboarding notification sequence (D+1, D+3, D+7).
  /// Called after onboarding when the user opts in to notifications.
  Future<void> scheduleOnboardingSequence({
    required int daysUntilNextHoliday,
    required int remainingBridgeDays,
    required String nextHolidayDate,
    required String nextHolidayName,
    String? bundeslandName,
  }) async {
    final now = DateTime.now();
    final (:l10n, languageCode: _) = await LocalizationHelper.current();

    // D+1: Encourage enabling reminders
    await scheduleBrueckentagReminder(
      id: _onboardingD1Id,
      title: l10n.notifHolidayInDaysTitle(daysUntilNextHoliday),
      body: l10n.notifPlanNowBody,
      scheduledDate: now.add(const Duration(days: 1)),
      payload: 'onboarding_d1',
    );

    // D+3: Show remaining bridge days
    await scheduleBrueckentagReminder(
      id: _onboardingD3Id,
      title: l10n.notifRemainingBridgeTitle(remainingBridgeDays, now.year),
      body: l10n.notifPlanBestBody,
      scheduledDate: now.add(const Duration(days: 3)),
      payload: 'onboarding_d3',
    );

    // D+7: Specific next holiday info
    final locationPrefix =
        bundeslandName != null ? '$bundeslandName: ' : '';
    await scheduleBrueckentagReminder(
      id: _onboardingD7Id,
      title: '$locationPrefix${l10n.notifNextHolidayTitle}',
      body: l10n.notifNextHolidayBody(nextHolidayDate, nextHolidayName),
      scheduledDate: now.add(const Duration(days: 7)),
      payload: 'onboarding_d7',
    );
  }

  /// Cancel onboarding sequence notifications
  Future<void> cancelOnboardingSequence() async {
    await _notifications.cancel(_onboardingD1Id);
    await _notifications.cancel(_onboardingD3Id);
    await _notifications.cancel(_onboardingD7Id);
  }

  /// Cancel a specific notification
  Future<void> cancelNotification(int id) async {
    await _notifications.cancel(id);
  }

  /// Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }

  /// Get pending notifications
  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return await _notifications.pendingNotificationRequests();
  }

  // Holiday reminder ID range: 1000-1999
  static const int _holidayReminderIdStart = 1000;
  static const int _holidayReminderIdEnd = 2000;

  /// Schedule D-7 and D-1 reminders for all upcoming holidays.
  ///
  /// Each reminder is scheduled to fire on the actual D-7 / D-1 evening,
  /// so the user does not need to open the app on that exact day for it to
  /// arrive. Re-run this on every app open to keep the queue fresh as the
  /// holiday list rolls forward.
  Future<void> scheduleHolidayReminders(List<Holiday> holidays) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('holiday_reminders_enabled') != true) {
      await _cancelHolidayReminders();
      return;
    }

    // Clear the existing holiday-reminder range before rescheduling.
    await _cancelHolidayReminders();

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final (:l10n, :languageCode) = await LocalizationHelper.current();
    int idCounter = _holidayReminderIdStart;

    // Only consider upcoming holidays, soonest first, capped so we stay well
    // within the reserved ID range (max ~500 holidays × 2 reminders).
    final upcoming = holidays
        .where((h) =>
            !DateTime(h.date.year, h.date.month, h.date.day).isBefore(today))
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));

    for (final holiday in upcoming) {
      if (idCounter >= _holidayReminderIdEnd - 1) break;

      final holidayDate =
          DateTime(holiday.date.year, holiday.date.month, holiday.date.day);
      final holidayName = holiday.displayName(languageCode);

      // D-7 reminder at 9pm, seven days before the holiday.
      final d7 = DateTime(
          holidayDate.year, holidayDate.month, holidayDate.day - 7, 21, 0);
      if (d7.isAfter(now)) {
        await scheduleBrueckentagReminder(
          id: idCounter++,
          title: l10n.notifHolidayIn7DaysTitle(holidayName),
          body: l10n.notifTimeToPlanBody,
          scheduledDate: d7,
          payload: 'holiday_d7',
        );
      }

      // D-1 reminder at 6pm, the evening before the holiday.
      final d1 = DateTime(
          holidayDate.year, holidayDate.month, holidayDate.day - 1, 18, 0);
      if (d1.isAfter(now)) {
        await scheduleBrueckentagReminder(
          id: idCounter++,
          title: l10n.notifHolidayTomorrowTitle(holidayName),
          body: l10n.notifEnjoyDayOffBody,
          scheduledDate: d1,
          payload: 'holiday_d1',
        );
      }
    }
  }

  /// Cancel all holiday reminders (ID range 1000-1999).
  Future<void> _cancelHolidayReminders() async {
    final pending = await _notifications.pendingNotificationRequests();
    for (final n in pending) {
      if (n.id >= _holidayReminderIdStart && n.id < _holidayReminderIdEnd) {
        await _notifications.cancel(n.id);
      }
    }
  }

  // Monthly summary ID range: 8001-8003 (up to 3 months ahead)
  static const int _monthlySummaryIdStart = 8001;
  static const int _monthlySummaryMonthsAhead = 3;

  /// Localized month names indexed 0 (January) .. 11 (December).
  static List<String> _monthNames(AppLocalizations l10n) => [
        l10n.january, l10n.february, l10n.march, l10n.april,
        l10n.may, l10n.june, l10n.july, l10n.august,
        l10n.september, l10n.october, l10n.november, l10n.december,
      ];

  /// Schedule monthly summary notifications for the next few months.
  ///
  /// For each upcoming month that has at least one holiday, schedule a
  /// notification on the 1st at 9am summarising that month's holidays.
  /// Re-run on every app open to keep the queue current.
  Future<void> scheduleMonthlyHolidaySummary(List<Holiday> holidays) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('monthly_summary_enabled') != true) {
      await _cancelMonthlySummaries();
      return;
    }

    await _cancelMonthlySummaries();

    final now = DateTime.now();
    final (:l10n, languageCode: _) = await LocalizationHelper.current();
    final monthNames = _monthNames(l10n);

    for (var offset = 1; offset <= _monthlySummaryMonthsAhead; offset++) {
      final target = DateTime(now.year, now.month + offset, 1, 9, 0);
      final holidayCount = holidays.where((h) =>
          h.date.year == target.year && h.date.month == target.month).length;

      if (holidayCount == 0) continue;

      final monthName = monthNames[target.month - 1];
      await scheduleBrueckentagReminder(
        id: _monthlySummaryIdStart + (offset - 1),
        title: l10n.notifMonthlySummaryTitle(monthName, holidayCount),
        body: l10n.notifMonthlySummaryBody(monthName),
        scheduledDate: target,
        payload: 'monthly_summary',
      );
    }
  }

  Future<void> _cancelMonthlySummaries() async {
    for (var i = 0; i < _monthlySummaryMonthsAhead; i++) {
      await _notifications.cancel(_monthlySummaryIdStart + i);
    }
  }

  // Next-year bridge days teaser ID
  static const int _nextYearTeaserId = 8201;

  /// Schedule the yearly "Brückentage {nextYear} sind da" teaser.
  ///
  /// Germans lock in next year's vacation in autumn — the teaser fires on
  /// Oct 1 at 10am and deep-links into the bridge day planner. Gated on the
  /// same preference as bridge day reminders.
  Future<void> scheduleNextYearBridgeTeaser() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('brueckentag_notifications_enabled') != true) {
      await _notifications.cancel(_nextYearTeaserId);
      return;
    }

    await _notifications.cancel(_nextYearTeaserId);

    final now = DateTime.now();
    var target = DateTime(now.year, 10, 1, 10, 0);
    if (!target.isAfter(now)) {
      target = DateTime(now.year + 1, 10, 1, 10, 0);
    }

    final (:l10n, languageCode: _) = await LocalizationHelper.current();
    await scheduleBrueckentagReminder(
      id: _nextYearTeaserId,
      title: l10n.notifNextYearBridgeTitle(target.year + 1),
      body: l10n.notifNextYearBridgeBody,
      scheduledDate: target,
      payload: 'next_year_bridge_teaser',
    );
  }

  /// Single entry point that refreshes every recurring notification type from
  /// the current holiday list. Call this whenever fresh holiday data loads
  /// (e.g. on app open). Each sub-scheduler self-gates on its enabled flag.
  ///
  /// Fails silently: notification init can fail on launch (see main.dart) or
  /// be unavailable in tests, and a re-engagement refresh must never crash the
  /// home screen.
  Future<void> refreshScheduledNotifications(List<Holiday> holidays) async {
    if (holidays.isEmpty || !_isInitialized) return;
    try {
      await scheduleHolidayReminders(holidays);
      await scheduleMonthlyHolidaySummary(holidays);
      await scheduleNextYearBridgeTeaser();
    } catch (e) {
      if (kDebugMode) {
        debugPrint('refreshScheduledNotifications failed: $e');
      }
    }
  }

  /// Show immediate notification (for testing)
  Future<void> showTestNotification() async {
    const androidDetails = AndroidNotificationDetails(
      'test_channel',
      'Test Notifications',
      channelDescription: 'Test notifications for debugging',
      importance: Importance.high,
      priority: Priority.high,
    );

    const details = NotificationDetails(
      android: androidDetails,
    );

    await _notifications.show(
      0,
      'Brückentage Tipp',
      'Nächste Woche: 2 Urlaubstage nehmen → 6 Tage frei!',
      details,
    );
  }
}
