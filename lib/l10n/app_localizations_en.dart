// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Holidays Germany';

  @override
  String get holidays => 'Holidays';

  @override
  String get bridgeDays => 'Bridge Days';

  @override
  String get allStates => 'All Federal States';

  @override
  String get state => 'Federal State';

  @override
  String get year => 'Year';

  @override
  String get month => 'Month';

  @override
  String get refresh => 'Refresh';

  @override
  String get retry => 'Retry';

  @override
  String get errorOccurred => 'An error occurred';

  @override
  String get noHolidaysFound => 'No holidays found';

  @override
  String get noBridgeDaysFound => 'No bridge days found';

  @override
  String get vacationDays => 'Vacation Days';

  @override
  String get daysOff => 'Days Off';

  @override
  String get efficiency => 'Efficiency';

  @override
  String get vacationRecommendation => 'Vacation Recommendation';

  @override
  String get vacationDaysNeeded => 'Vacation days needed';

  @override
  String get totalDaysOff => 'Total Days Off';

  @override
  String get relatedHolidays => 'Holidays';

  @override
  String get veryGood => 'Very good';

  @override
  String get good => 'Good';

  @override
  String get okay => 'Okay';

  @override
  String get low => 'Low';

  @override
  String get january => 'January';

  @override
  String get february => 'February';

  @override
  String get march => 'March';

  @override
  String get april => 'April';

  @override
  String get may => 'May';

  @override
  String get june => 'June';

  @override
  String get july => 'July';

  @override
  String get august => 'August';

  @override
  String get september => 'September';

  @override
  String get october => 'October';

  @override
  String get november => 'November';

  @override
  String get december => 'December';

  @override
  String bridgeDayLabel(int days, int total) {
    return '$days vacation days → $total days off';
  }

  @override
  String get language => 'Language';

  @override
  String get settings => 'Settings';

  @override
  String get systemDefault => 'System language';

  @override
  String get aboutApp => 'About This App';

  @override
  String get importantInfoHeader => '⚠️ IMPORTANT INFORMATION';

  @override
  String get disclaimerBody =>
      'This app is NOT an official government application and is not affiliated with any government agency. It is an independent, private information service. For binding information, please contact the relevant authorities directly.';

  @override
  String get dataSource => 'Data Source';

  @override
  String get dataSourceBody =>
      'The holiday data is based on the official statutory regulations of the Federal Republic of Germany. The authoritative sources are:';

  @override
  String get sourceBmiLabel => 'BMI – National Holidays';

  @override
  String get technicalImplementation => 'Technical Implementation';

  @override
  String get technicalImplementationBody =>
      'The OpenHolidays API is used to technically provide the data, aggregating holiday information from the official sources mentioned above.';

  @override
  String get sourceOpenHolidaysLabel => 'OpenHolidays API';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get close => 'Close';

  @override
  String get yearOverview => 'Year Overview';

  @override
  String get notifications => 'Notifications';

  @override
  String dDayLabel(int days) {
    return 'D-$days';
  }

  @override
  String get tomorrowIsHoliday => 'Tomorrow is a holiday';

  @override
  String daysRemaining(int days) {
    return '$days days left';
  }

  @override
  String get tomorrowVacationStarts => 'Vacation starts tomorrow';

  @override
  String get onboardingHeadline => '1 day off.\n4 days free.';

  @override
  String get onboardingSubtitle =>
      'Find the best bridge days in your federal state and maximize your vacation.';

  @override
  String get featureAllHolidays => 'All holidays at a glance';

  @override
  String get featureSmartBridgeDays => 'Smart bridge day recommendations';

  @override
  String get featureReminders => 'Reminders before bridge days';

  @override
  String get letsGo => 'Let\'s go';

  @override
  String get yourState => 'Your Federal State';

  @override
  String get stateSelectionSubtitle =>
      'Holidays vary by federal state. Choose yours.';

  @override
  String get next => 'Next';

  @override
  String get almostDone => 'Almost done!';

  @override
  String get vacationDaysPerYear => 'Vacation days per year';

  @override
  String get howManyVacationDays => 'How many vacation days do you have?';

  @override
  String get bridgeDayReminders => 'Bridge Day Reminders';

  @override
  String get bridgeDayRemindersSubtitle =>
      'Get notified before optimal bridge days';

  @override
  String get showSchoolHolidays => 'Show school holidays';

  @override
  String get showSchoolHolidaysSubtitleShort =>
      'Your federal state\'s school holidays in the calendar';

  @override
  String get done => 'Done';

  @override
  String get previousYear => 'Previous year';

  @override
  String get nextYear => 'Next year';

  @override
  String get nationwide => 'Nationwide';

  @override
  String get regional => 'Regional';

  @override
  String get additionalDaysOff => 'Additional day off';

  @override
  String bridgeDaysWithYear(int year) {
    return 'Bridge Days $year';
  }

  @override
  String daysCount(int count) {
    return '$count days';
  }

  @override
  String get calendarExportFailed => 'Calendar export could not be opened.';

  @override
  String get addToCalendar => 'Add to calendar';

  @override
  String get notificationHeaderSubtitle =>
      'Get reminded in time about optimal vacation days';

  @override
  String get notificationsNotSupported =>
      'Notifications are not supported on this platform.';

  @override
  String get bridgeDayNotifications => 'Bridge Day Notifications';

  @override
  String get bridgeDayNotificationsSubtitle =>
      'Receive reminders before optimal vacation days';

  @override
  String get holidayReminders => 'Holiday Reminders';

  @override
  String get holidayRemindersSubtitle =>
      'Remind 7 days and 1 day before each holiday';

  @override
  String get remindBefore => 'Remind before';

  @override
  String daysBefore(int days) {
    return '$days days before';
  }

  @override
  String get monthlySummary => 'Monthly Summary';

  @override
  String get monthlySummarySubtitle =>
      'Get an overview of the holidays on the 1st of every month';

  @override
  String get calendar => 'Calendar';

  @override
  String get showSchoolHolidaysSubtitle =>
      'Show your federal state\'s school holidays in the calendar';

  @override
  String get howItWorks => 'How it works';

  @override
  String get autoDetectionTitle => 'Automatic detection';

  @override
  String get autoDetectionBody =>
      'The app finds the best bridge days based on your federal state.';

  @override
  String get timelyReminderTitle => 'Timely reminder';

  @override
  String get timelyReminderBody =>
      'You\'ll be notified in time before the optimal period.';

  @override
  String get moreVacationTitle => 'More vacation';

  @override
  String get moreVacationBody =>
      'Use just a few vacation days for maximum time off!';

  @override
  String get errorLoadingSettings => 'Error loading settings';

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'OK';

  @override
  String get selectState => 'Select federal state';

  @override
  String get selectYearAndMonth => 'Select year and month';

  @override
  String get bridgeDayTips => 'Bridge Day Tips';

  @override
  String get showAll => 'Show all';

  @override
  String vacationToDaysOff(int vacationDays, int totalDaysOff) {
    return '$vacationDays → $totalDaysOff days';
  }

  @override
  String get vacationSettings => 'Vacation Settings';

  @override
  String get annualVacationDays => 'Annual vacation (days)';

  @override
  String get remainingVacationReminder => 'Remaining Vacation Reminder';

  @override
  String get redeemByMarch31 => 'Use by March 31';

  @override
  String get save => 'Save';

  @override
  String get vacationEntitlement => 'Vacation Entitlement';

  @override
  String get edit => 'Edit';

  @override
  String daysTakenOfTotal(int used, int total) {
    return '$used of $total days taken';
  }

  @override
  String daysRemainingCount(int count) {
    return '$count days left';
  }

  @override
  String get bestVacationEfficiency => 'Best Vacation Efficiency';

  @override
  String get noBridgeDaysAvailable => 'No bridge days available';

  @override
  String oneVacationDayEquals(int totalDaysOff) {
    return '1 vacation day = $totalDaysOff days off';
  }

  @override
  String get legalHoliday => 'Public Holiday';

  @override
  String get noHoliday => 'No holiday';

  @override
  String durationDaysParen(int count) {
    return '($count days)';
  }

  @override
  String get addVacation => 'Add vacation';

  @override
  String get moreHolidays => 'More holidays';

  @override
  String addedToCalendar(String name) {
    return '$name will be added to the calendar';
  }

  @override
  String get takeMondayOff => 'Take Monday off';

  @override
  String get takeFridayOff => 'Take Friday off';

  @override
  String get fourDaysOffPossible => '→ 4 days off possible!';

  @override
  String get bridgeDayTip => 'Bridge Day Tip';

  @override
  String calendarWeekNumber(int week) {
    return 'CW$week';
  }

  @override
  String get labelOptional => 'Label (optional)';

  @override
  String get from => 'From';

  @override
  String get to => 'To';

  @override
  String get vacationDefaultTitle => 'Vacation';

  @override
  String get adLabel => 'Ad';

  @override
  String get monday => 'Monday';

  @override
  String get tuesday => 'Tuesday';

  @override
  String get wednesday => 'Wednesday';

  @override
  String get thursday => 'Thursday';

  @override
  String get friday => 'Friday';

  @override
  String get saturday => 'Saturday';

  @override
  String get sunday => 'Sunday';

  @override
  String notifHolidayInDaysTitle(int days) {
    return 'Next holiday in $days days!';
  }

  @override
  String get notifPlanNowBody =>
      'Plan your bridge days now and maximize your vacation.';

  @override
  String notifRemainingBridgeTitle(int count, int year) {
    return '$count bridge days left in $year';
  }

  @override
  String get notifPlanBestBody =>
      'Plan now and get the most out of your vacation!';

  @override
  String get notifNextHolidayTitle => 'Next holiday';

  @override
  String notifNextHolidayBody(String date, String name) {
    return '$date — $name. Open the app for bridge day tips!';
  }

  @override
  String notifHolidayIn7DaysTitle(String name) {
    return 'In 7 days: $name';
  }

  @override
  String get notifTimeToPlanBody =>
      'Still time to plan! Check out the bridge days.';

  @override
  String notifHolidayTomorrowTitle(String name) {
    return 'Tomorrow: $name 🎉';
  }

  @override
  String get notifEnjoyDayOffBody => 'Enjoy your day off!';

  @override
  String notifMonthlySummaryTitle(String month, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count holidays',
      one: '$count holiday',
    );
    return '$month: $_temp0';
  }

  @override
  String notifMonthlySummaryBody(String month) {
    return 'Open the app and find the best bridge days in $month!';
  }

  @override
  String get notifChannelName => 'Bridge Day Reminders';

  @override
  String get notifChannelDescription =>
      'Reminders for bridge day vacation planning';

  @override
  String exportBridgeDaySummary(String holidays) {
    return 'Bridge Days: $holidays';
  }

  @override
  String get exportBridgeDayTitle => 'Vacation (Bridge Day)';

  @override
  String get removeAdsTitle => 'Remove ads';

  @override
  String get removeAdsSubtitle => 'Pay once, ad-free forever.';

  @override
  String buyForPrice(String price) {
    return 'Buy for $price';
  }

  @override
  String get buyNow => 'Buy now';

  @override
  String get restorePurchases => 'Restore purchases';

  @override
  String get premiumActiveTitle => 'Ad-free active';

  @override
  String get premiumActiveSubtitle => 'Thank you for your support!';

  @override
  String get purchaseError =>
      'Purchase could not be completed. Please try again later.';

  @override
  String get country => 'Country';

  @override
  String get countryGermany => 'Germany';

  @override
  String get countryAustria => 'Austria';

  @override
  String get countrySwitzerland => 'Switzerland';

  @override
  String get allCantons => 'All cantons';

  @override
  String get yourCanton => 'Your canton';
}
