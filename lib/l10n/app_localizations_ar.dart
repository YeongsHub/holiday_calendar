// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'العطلات الرسمية في ألمانيا';

  @override
  String get holidays => 'العطلات الرسمية';

  @override
  String get bridgeDays => 'أيام الجسر';

  @override
  String get allStates => 'جميع الولايات';

  @override
  String get state => 'الولاية';

  @override
  String get year => 'السنة';

  @override
  String get month => 'الشهر';

  @override
  String get refresh => 'تحديث';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get errorOccurred => 'حدث خطأ';

  @override
  String get noHolidaysFound => 'لم يتم العثور على عطلات رسمية';

  @override
  String get noBridgeDaysFound => 'لم يتم العثور على أيام جسر';

  @override
  String get vacationDays => 'أيام الإجازة';

  @override
  String get daysOff => 'أيام العطلة';

  @override
  String get efficiency => 'الكفاءة';

  @override
  String get vacationRecommendation => 'توصية الإجازة';

  @override
  String get vacationDaysNeeded => 'أيام الإجازة المطلوبة';

  @override
  String get totalDaysOff => 'إجمالي أيام العطلة';

  @override
  String get relatedHolidays => 'العطلات الرسمية';

  @override
  String get veryGood => 'ممتاز';

  @override
  String get good => 'جيد';

  @override
  String get okay => 'مقبول';

  @override
  String get low => 'منخفض';

  @override
  String get january => 'يناير';

  @override
  String get february => 'فبراير';

  @override
  String get march => 'مارس';

  @override
  String get april => 'أبريل';

  @override
  String get may => 'مايو';

  @override
  String get june => 'يونيو';

  @override
  String get july => 'يوليو';

  @override
  String get august => 'أغسطس';

  @override
  String get september => 'سبتمبر';

  @override
  String get october => 'أكتوبر';

  @override
  String get november => 'نوفمبر';

  @override
  String get december => 'ديسمبر';

  @override
  String bridgeDayLabel(int days, int total) {
    return '$days أيام إجازة → $total أيام عطلة';
  }

  @override
  String get language => 'اللغة';

  @override
  String get settings => 'الإعدادات';

  @override
  String get systemDefault => 'لغة النظام';

  @override
  String get aboutApp => 'حول هذا التطبيق';

  @override
  String get importantInfoHeader => '⚠️ معلومات مهمة';

  @override
  String get disclaimerBody =>
      'هذا التطبيق ليس تطبيقًا حكوميًا رسميًا ولا يرتبط بأي جهة حكومية. إنه خدمة معلومات مستقلة وخاصة. للحصول على معلومات ملزمة، يرجى التواصل مباشرة مع الجهات المختصة.';

  @override
  String get dataSource => 'مصدر البيانات';

  @override
  String get dataSourceBody =>
      'تستند بيانات العطلات الرسمية إلى اللوائح القانونية الرسمية لجمهورية ألمانيا الاتحادية. المصادر المعتمدة هي:';

  @override
  String get sourceBmiLabel =>
      'وزارة الداخلية الاتحادية – العطلات الرسمية الوطنية';

  @override
  String get technicalImplementation => 'التنفيذ التقني';

  @override
  String get technicalImplementationBody =>
      'لتوفير البيانات تقنيًا، يتم استخدام واجهة OpenHolidays API التي تجمع معلومات العطلات الرسمية من المصادر الرسمية المذكورة أعلاه.';

  @override
  String get sourceOpenHolidaysLabel => 'OpenHolidays API';

  @override
  String get privacyPolicy => 'الخصوصية';

  @override
  String get close => 'إغلاق';

  @override
  String get yearOverview => 'نظرة عامة على السنة';

  @override
  String get notifications => 'الإشعارات';

  @override
  String dDayLabel(int days) {
    return 'D-$days';
  }

  @override
  String get tomorrowIsHoliday => 'غدًا عطلة رسمية';

  @override
  String daysRemaining(int days) {
    return 'باقٍ $days أيام';
  }

  @override
  String get tomorrowVacationStarts => 'تبدأ الإجازة غدًا';

  @override
  String get onboardingHeadline => 'يوم إجازة واحد.\n4 أيام عطلة.';

  @override
  String get onboardingSubtitle =>
      'اكتشف أفضل أيام الجسر في ولايتك وحقق أقصى استفادة من إجازتك.';

  @override
  String get featureAllHolidays => 'جميع العطلات الرسمية في لمحة واحدة';

  @override
  String get featureSmartBridgeDays => 'توصيات ذكية لأيام الجسر';

  @override
  String get featureReminders => 'تذكيرات قبل أيام الجسر';

  @override
  String get letsGo => 'هيا بنا';

  @override
  String get yourState => 'ولايتك';

  @override
  String get stateSelectionSubtitle =>
      'تختلف العطلات الرسمية باختلاف الولاية. اختر ولايتك.';

  @override
  String get next => 'التالي';

  @override
  String get almostDone => 'أوشكت على الانتهاء!';

  @override
  String get vacationDaysPerYear => 'أيام الإجازة في السنة';

  @override
  String get howManyVacationDays => 'كم عدد أيام إجازتك؟';

  @override
  String get bridgeDayReminders => 'تذكيرات أيام الجسر';

  @override
  String get bridgeDayRemindersSubtitle =>
      'احصل على إشعار قبل أيام الجسر المثالية';

  @override
  String get showSchoolHolidays => 'عرض العطلة المدرسية';

  @override
  String get showSchoolHolidaysSubtitleShort =>
      'العطلة المدرسية لولايتك في التقويم';

  @override
  String get done => 'تم';

  @override
  String get previousYear => 'السنة السابقة';

  @override
  String get nextYear => 'السنة التالية';

  @override
  String get nationwide => 'على مستوى البلاد';

  @override
  String get regional => 'إقليمي';

  @override
  String get additionalDaysOff => 'أيام عطلة إضافية';

  @override
  String bridgeDaysWithYear(int year) {
    return 'أيام الجسر $year';
  }

  @override
  String daysCount(int count) {
    return '$count أيام';
  }

  @override
  String get calendarExportFailed => 'تعذر فتح تصدير التقويم.';

  @override
  String get addToCalendar => 'إضافة إلى التقويم';

  @override
  String get notificationHeaderSubtitle =>
      'احصل على تذكير في الوقت المناسب بأيام الإجازة المثالية';

  @override
  String get notificationsNotSupported =>
      'الإشعارات غير مدعومة على هذه المنصة.';

  @override
  String get bridgeDayNotifications => 'إشعارات أيام الجسر';

  @override
  String get bridgeDayNotificationsSubtitle =>
      'احصل على تذكيرات قبل أيام الإجازة المثالية';

  @override
  String get holidayReminders => 'تذكيرات العطلات الرسمية';

  @override
  String get holidayRemindersSubtitle =>
      'التذكير قبل 7 أيام ويوم واحد من كل عطلة رسمية';

  @override
  String get remindBefore => 'التذكير قبل';

  @override
  String daysBefore(int days) {
    return 'قبل $days أيام';
  }

  @override
  String get monthlySummary => 'الملخص الشهري';

  @override
  String get monthlySummarySubtitle =>
      'احصل على نظرة عامة للعطلات الرسمية في اليوم الأول من كل شهر';

  @override
  String get calendar => 'التقويم';

  @override
  String get showSchoolHolidaysSubtitle =>
      'عرض العطلة المدرسية لولايتك في التقويم';

  @override
  String get howItWorks => 'كيف يعمل';

  @override
  String get autoDetectionTitle => 'الكشف التلقائي';

  @override
  String get autoDetectionBody =>
      'يعثر التطبيق على أفضل أيام الجسر بناءً على ولايتك.';

  @override
  String get timelyReminderTitle => 'تذكير في الوقت المناسب';

  @override
  String get timelyReminderBody =>
      'سيتم إشعارك في الوقت المناسب قبل الفترة المثالية.';

  @override
  String get moreVacationTitle => 'المزيد من الإجازة';

  @override
  String get moreVacationBody =>
      'استخدم أيام إجازة قليلة للحصول على أقصى وقت عطلة!';

  @override
  String get errorLoadingSettings => 'خطأ أثناء تحميل الإعدادات';

  @override
  String get cancel => 'إلغاء';

  @override
  String get ok => 'موافق';

  @override
  String get selectState => 'اختر الولاية';

  @override
  String get selectYearAndMonth => 'اختر السنة والشهر';

  @override
  String get bridgeDayTips => 'نصائح أيام الجسر';

  @override
  String get showAll => 'عرض الكل';

  @override
  String vacationToDaysOff(int vacationDays, int totalDaysOff) {
    return '$vacationDays → $totalDaysOff أيام';
  }

  @override
  String get vacationSettings => 'إعدادات الإجازة';

  @override
  String get annualVacationDays => 'الإجازة السنوية (أيام)';

  @override
  String get remainingVacationReminder => 'تذكير الإجازة المتبقية';

  @override
  String get redeemByMarch31 => 'استخدمها قبل 31 مارس';

  @override
  String get save => 'حفظ';

  @override
  String get vacationEntitlement => 'رصيد الإجازة';

  @override
  String get edit => 'تعديل';

  @override
  String daysTakenOfTotal(int used, int total) {
    return 'تم أخذ $used من $total أيام';
  }

  @override
  String daysRemainingCount(int count) {
    return 'باقٍ $count أيام';
  }

  @override
  String get bestVacationEfficiency => 'أفضل كفاءة للإجازة';

  @override
  String get noBridgeDaysAvailable => 'لا توجد أيام جسر متاحة';

  @override
  String oneVacationDayEquals(int totalDaysOff) {
    return 'يوم إجازة واحد = $totalDaysOff أيام عطلة';
  }

  @override
  String get legalHoliday => 'عطلة رسمية قانونية';

  @override
  String get noHoliday => 'لا توجد عطلة رسمية';

  @override
  String durationDaysParen(int count) {
    return '($count أيام)';
  }

  @override
  String get addVacation => 'تسجيل إجازة';

  @override
  String get moreHolidays => 'المزيد من العطلات الرسمية';

  @override
  String addedToCalendar(String name) {
    return 'تتم إضافة $name إلى التقويم';
  }

  @override
  String get takeMondayOff => 'خذ إجازة يوم الاثنين';

  @override
  String get takeFridayOff => 'خذ إجازة يوم الجمعة';

  @override
  String get fourDaysOffPossible => '→ 4 أيام عطلة ممكنة!';

  @override
  String get bridgeDayTip => 'نصيحة يوم الجسر';

  @override
  String calendarWeekNumber(int week) {
    return 'أسبوع $week';
  }

  @override
  String get labelOptional => 'التسمية (اختياري)';

  @override
  String get from => 'من';

  @override
  String get to => 'إلى';

  @override
  String get vacationDefaultTitle => 'إجازة';

  @override
  String get adLabel => 'إعلان';

  @override
  String get monday => 'الاثنين';

  @override
  String get tuesday => 'الثلاثاء';

  @override
  String get wednesday => 'الأربعاء';

  @override
  String get thursday => 'الخميس';

  @override
  String get friday => 'الجمعة';

  @override
  String get saturday => 'السبت';

  @override
  String get sunday => 'الأحد';

  @override
  String notifHolidayInDaysTitle(int days) {
    return 'العطلة الرسمية التالية خلال $days أيام!';
  }

  @override
  String get notifPlanNowBody =>
      'خطط الآن لأيام الجسر الخاصة بك وحقق أقصى استفادة من إجازتك.';

  @override
  String notifRemainingBridgeTitle(int count, int year) {
    return 'باقٍ $count من أيام الجسر في $year';
  }

  @override
  String get notifPlanBestBody => 'خطط الآن وحقق أقصى استفادة من إجازتك!';

  @override
  String get notifNextHolidayTitle => 'العطلة الرسمية التالية';

  @override
  String notifNextHolidayBody(String date, String name) {
    return '$date — $name. افتح التطبيق للحصول على نصائح أيام الجسر!';
  }

  @override
  String notifHolidayIn7DaysTitle(String name) {
    return 'خلال 7 أيام: $name';
  }

  @override
  String get notifTimeToPlanBody =>
      'لا يزال هناك وقت للتخطيط! ألقِ نظرة على أيام الجسر.';

  @override
  String notifHolidayTomorrowTitle(String name) {
    return 'غدًا: $name 🎉';
  }

  @override
  String get notifEnjoyDayOffBody => 'استمتع بيوم عطلتك!';

  @override
  String notifMonthlySummaryTitle(String month, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count عطلة',
      many: '$count عطلة',
      few: '$count أيام عطل',
      two: 'عطلتان',
      one: 'عطلة واحدة',
      zero: 'لا أيام عطل',
    );
    return '$month: $_temp0';
  }

  @override
  String notifMonthlySummaryBody(String month) {
    return 'افتح التطبيق واكتشف أفضل أيام الجسر في $month!';
  }

  @override
  String get notifChannelName => 'تذكيرات أيام الجسر';

  @override
  String get notifChannelDescription => 'تذكيرات لتخطيط إجازة أيام الجسر';

  @override
  String exportBridgeDaySummary(String holidays) {
    return 'أيام الجسر: $holidays';
  }

  @override
  String get exportBridgeDayTitle => 'إجازة (يوم جسر)';

  @override
  String get removeAdsTitle => 'إزالة الإعلانات';

  @override
  String get removeAdsSubtitle => 'ادفع مرة واحدة، بدون إعلانات للأبد.';

  @override
  String buyForPrice(String price) {
    return 'اشترِ مقابل $price';
  }

  @override
  String get buyNow => 'اشترِ الآن';

  @override
  String get restorePurchases => 'استعادة المشتريات';

  @override
  String get premiumActiveTitle => 'وضع بدون إعلانات مفعّل';

  @override
  String get premiumActiveSubtitle => 'شكرًا لدعمك!';

  @override
  String get purchaseError => 'تعذّر إتمام الشراء. يُرجى المحاولة لاحقًا.';

  @override
  String get country => 'الدولة';

  @override
  String get countryGermany => 'ألمانيا';

  @override
  String get countryAustria => 'النمسا';

  @override
  String get countrySwitzerland => 'سويسرا';

  @override
  String get allCantons => 'جميع الكانتونات';

  @override
  String get yourCanton => 'الكانتون الخاص بك';
}
