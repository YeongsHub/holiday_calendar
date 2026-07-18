import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/core/services/analytics_service.dart';
import 'package:holiday_calendar/core/services/notification_service.dart';
import 'package:holiday_calendar/core/services/purchase_service.dart';
import 'package:holiday_calendar/core/theme/app_theme.dart';
import 'package:holiday_calendar/l10n/app_localizations.dart';
import 'package:holiday_calendar/presentation/providers/locale_provider.dart';
import 'package:holiday_calendar/presentation/screens/bridge_day_screen.dart';
import 'package:holiday_calendar/presentation/screens/home_screen.dart';
import 'package:holiday_calendar/presentation/screens/onboarding_screen.dart';

class HolidayCalendarApp extends ConsumerWidget {
  const HolidayCalendarApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // null → follow the system language; a value forces that language.
    final locale = ref.watch(appLocaleProvider);

    // Subscribe to the Play Billing purchase stream once for the app's
    // lifetime (delivers pending purchases, restores, and refunds).
    ref.watch(purchaseServiceInitProvider);

    return MaterialApp(
      // Title is localized via onGenerateTitle so it follows the app locale.
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      navigatorKey: navigatorKey,
      locale: locale,
      // Wire the Firebase observer so screen transitions are tracked
      // automatically — without this, screen_view events never fire.
      navigatorObservers: [AnalyticsService().observer],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: supportedAppLocales,
      routes: {
        '/bridge-days': (_) => const BridgeDayScreen(),
      },
      home: FutureBuilder<bool>(
        future: isOnboardingComplete(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return snapshot.data!
              ? const HomeScreen()
              : const OnboardingScreen();
        },
      ),
    );
  }
}
