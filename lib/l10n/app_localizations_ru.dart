// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Праздники Германии';

  @override
  String get holidays => 'Праздники';

  @override
  String get bridgeDays => 'Длинные выходные';

  @override
  String get allStates => 'Все земли';

  @override
  String get state => 'Земля';

  @override
  String get year => 'Год';

  @override
  String get month => 'Месяц';

  @override
  String get refresh => 'Обновить';

  @override
  String get retry => 'Повторить';

  @override
  String get errorOccurred => 'Произошла ошибка';

  @override
  String get noHolidaysFound => 'Праздники не найдены';

  @override
  String get noBridgeDaysFound => 'Длинные выходные не найдены';

  @override
  String get vacationDays => 'Дни отпуска';

  @override
  String get daysOff => 'Выходных дней';

  @override
  String get efficiency => 'Эффективность';

  @override
  String get vacationRecommendation => 'Рекомендация по отпуску';

  @override
  String get vacationDaysNeeded => 'Требуется дней отпуска';

  @override
  String get totalDaysOff => 'Всего выходных дней';

  @override
  String get relatedHolidays => 'Праздники';

  @override
  String get veryGood => 'Отлично';

  @override
  String get good => 'Хорошо';

  @override
  String get okay => 'Нормально';

  @override
  String get low => 'Низкая';

  @override
  String get january => 'Январь';

  @override
  String get february => 'Февраль';

  @override
  String get march => 'Март';

  @override
  String get april => 'Апрель';

  @override
  String get may => 'Май';

  @override
  String get june => 'Июнь';

  @override
  String get july => 'Июль';

  @override
  String get august => 'Август';

  @override
  String get september => 'Сентябрь';

  @override
  String get october => 'Октябрь';

  @override
  String get november => 'Ноябрь';

  @override
  String get december => 'Декабрь';

  @override
  String bridgeDayLabel(int days, int total) {
    return '$days дней отпуска → $total выходных дней';
  }

  @override
  String get language => 'Язык';

  @override
  String get settings => 'Настройки';

  @override
  String get systemDefault => 'Язык системы';

  @override
  String get aboutApp => 'О приложении';

  @override
  String get importantInfoHeader => '⚠️ ВАЖНАЯ ИНФОРМАЦИЯ';

  @override
  String get disclaimerBody =>
      'Это приложение НЕ является официальным государственным приложением и не связано с государственными органами. Это независимый, частный информационный ресурс. За юридически обязательной информацией обращайтесь напрямую в соответствующие органы.';

  @override
  String get dataSource => 'Источник данных';

  @override
  String get dataSourceBody =>
      'Данные о праздниках основаны на официальных публикациях Германии, Австрии и Швейцарии. Авторитетные источники:';

  @override
  String get sourceBmiLabel => 'BMI — Национальные праздники';

  @override
  String get technicalImplementation => 'Техническая реализация';

  @override
  String get technicalImplementationBody =>
      'Для технического предоставления данных используется OpenHolidays API, который агрегирует информацию о праздниках из указанных выше официальных источников.';

  @override
  String get sourceOpenHolidaysLabel => 'OpenHolidays API';

  @override
  String get privacyPolicy => 'Конфиденциальность';

  @override
  String get close => 'Закрыть';

  @override
  String get yearOverview => 'Обзор года';

  @override
  String get notifications => 'Уведомления';

  @override
  String dDayLabel(int days) {
    return 'D-$days';
  }

  @override
  String get tomorrowIsHoliday => 'Завтра праздник';

  @override
  String daysRemaining(int days) {
    return 'Осталось $days дней';
  }

  @override
  String get tomorrowVacationStarts => 'Завтра начинается отпуск';

  @override
  String get onboardingHeadline => '1 день отпуска.\n4 дня выходных.';

  @override
  String get onboardingSubtitle =>
      'Найдите лучшие длинные выходные в вашей земле и максимально используйте отпуск.';

  @override
  String get featureAllHolidays => 'Все праздники с первого взгляда';

  @override
  String get featureSmartBridgeDays => 'Умные рекомендации по длинным выходным';

  @override
  String get featureReminders => 'Напоминания перед длинными выходными';

  @override
  String get letsGo => 'Начать';

  @override
  String get yourState => 'Ваша земля';

  @override
  String get stateSelectionSubtitle =>
      'Праздники различаются в зависимости от земли. Выберите свою.';

  @override
  String get next => 'Далее';

  @override
  String get almostDone => 'Почти готово!';

  @override
  String get vacationDaysPerYear => 'Дней отпуска в год';

  @override
  String get howManyVacationDays => 'Сколько у вас дней отпуска?';

  @override
  String get bridgeDayReminders => 'Напоминания о длинных выходных';

  @override
  String get bridgeDayRemindersSubtitle =>
      'Получайте уведомления об оптимальных длинных выходных';

  @override
  String get showSchoolHolidays => 'Показывать школьные каникулы';

  @override
  String get showSchoolHolidaysSubtitleShort =>
      'Школьные каникулы вашей земли в календаре';

  @override
  String get done => 'Готово';

  @override
  String get previousYear => 'Предыдущий год';

  @override
  String get nextYear => 'Следующий год';

  @override
  String get nationwide => 'По всей стране';

  @override
  String get regional => 'Региональный';

  @override
  String get additionalDaysOff => 'Дополнительно выходной';

  @override
  String bridgeDaysWithYear(int year) {
    return 'Длинные выходные $year';
  }

  @override
  String daysCount(int count) {
    return '$count дней';
  }

  @override
  String get calendarExportFailed => 'Не удалось открыть экспорт в календарь.';

  @override
  String get addToCalendar => 'Добавить в календарь';

  @override
  String get notificationHeaderSubtitle =>
      'Получайте своевременные напоминания об оптимальных днях отпуска';

  @override
  String get notificationsNotSupported =>
      'Уведомления не поддерживаются на этой платформе.';

  @override
  String get bridgeDayNotifications => 'Уведомления о длинных выходных';

  @override
  String get bridgeDayNotificationsSubtitle =>
      'Получайте напоминания об оптимальных днях отпуска';

  @override
  String get holidayReminders => 'Напоминания о праздниках';

  @override
  String get holidayRemindersSubtitle =>
      'Напоминать за 7 дней и за 1 день до каждого праздника';

  @override
  String get remindBefore => 'Напомнить за';

  @override
  String daysBefore(int days) {
    return 'за $days дней';
  }

  @override
  String get monthlySummary => 'Ежемесячная сводка';

  @override
  String get monthlySummarySubtitle =>
      'Получать обзор праздников 1-го числа каждого месяца';

  @override
  String get calendar => 'Календарь';

  @override
  String get showSchoolHolidaysSubtitle =>
      'Показывать школьные каникулы вашей земли в календаре';

  @override
  String get howItWorks => 'Как это работает';

  @override
  String get autoDetectionTitle => 'Автоматическое определение';

  @override
  String get autoDetectionBody =>
      'Приложение находит лучшие длинные выходные на основе вашей земли.';

  @override
  String get timelyReminderTitle => 'Своевременное напоминание';

  @override
  String get timelyReminderBody =>
      'Вы получите уведомление заранее, до наступления оптимального периода.';

  @override
  String get moreVacationTitle => 'Больше отпуска';

  @override
  String get moreVacationBody =>
      'Используйте несколько дней отпуска для максимального свободного времени!';

  @override
  String get errorLoadingSettings => 'Ошибка при загрузке настроек';

  @override
  String get cancel => 'Отмена';

  @override
  String get ok => 'OK';

  @override
  String get selectState => 'Выбрать землю';

  @override
  String get selectYearAndMonth => 'Выбрать год и месяц';

  @override
  String get bridgeDayTips => 'Советы по длинным выходным';

  @override
  String get showAll => 'Показать все';

  @override
  String vacationToDaysOff(int vacationDays, int totalDaysOff) {
    return '$vacationDays → $totalDaysOff дней';
  }

  @override
  String get vacationSettings => 'Настройки отпуска';

  @override
  String get annualVacationDays => 'Годовой отпуск (дни)';

  @override
  String get remainingVacationReminder => 'Напоминание об остатке отпуска';

  @override
  String get redeemByMarch31 => 'Использовать до 31 марта';

  @override
  String get save => 'Сохранить';

  @override
  String get vacationEntitlement => 'Право на отпуск';

  @override
  String get edit => 'Изменить';

  @override
  String daysTakenOfTotal(int used, int total) {
    return 'Использовано $used из $total дней';
  }

  @override
  String daysRemainingCount(int count) {
    return 'Осталось $count дней';
  }

  @override
  String get bestVacationEfficiency => 'Лучшая эффективность отпуска';

  @override
  String get noBridgeDaysAvailable => 'Длинные выходные недоступны';

  @override
  String oneVacationDayEquals(int totalDaysOff) {
    return '1 день отпуска = $totalDaysOff выходных дней';
  }

  @override
  String get legalHoliday => 'Официальный праздник';

  @override
  String get noHoliday => 'Не праздник';

  @override
  String durationDaysParen(int count) {
    return '($count дней)';
  }

  @override
  String get addVacation => 'Добавить отпуск';

  @override
  String get moreHolidays => 'Другие праздники';

  @override
  String addedToCalendar(String name) {
    return '$name добавляется в календарь';
  }

  @override
  String get takeMondayOff => 'Взять отпуск в понедельник';

  @override
  String get takeFridayOff => 'Взять отпуск в пятницу';

  @override
  String get fourDaysOffPossible => '→ Возможны 4 выходных дня!';

  @override
  String get bridgeDayTip => 'Совет по длинным выходным';

  @override
  String calendarWeekNumber(int week) {
    return 'Нед.$week';
  }

  @override
  String get labelOptional => 'Название (необязательно)';

  @override
  String get from => 'С';

  @override
  String get to => 'По';

  @override
  String get vacationDefaultTitle => 'Отпуск';

  @override
  String get adLabel => 'Реклама';

  @override
  String get monday => 'Понедельник';

  @override
  String get tuesday => 'Вторник';

  @override
  String get wednesday => 'Среда';

  @override
  String get thursday => 'Четверг';

  @override
  String get friday => 'Пятница';

  @override
  String get saturday => 'Суббота';

  @override
  String get sunday => 'Воскресенье';

  @override
  String notifHolidayInDaysTitle(int days) {
    return 'Следующий праздник через $days дней!';
  }

  @override
  String get notifPlanNowBody =>
      'Спланируйте свои длинные выходные прямо сейчас и максимально используйте отпуск.';

  @override
  String notifRemainingBridgeTitle(int count, int year) {
    return 'Осталось $count длинных выходных в $year';
  }

  @override
  String get notifPlanBestBody =>
      'Планируйте сейчас и получите максимум от своего отпуска!';

  @override
  String get notifNextHolidayTitle => 'Следующий праздник';

  @override
  String notifNextHolidayBody(String date, String name) {
    return '$date — $name. Откройте приложение для советов по длинным выходным!';
  }

  @override
  String notifHolidayIn7DaysTitle(String name) {
    return 'Через 7 дней: $name';
  }

  @override
  String get notifTimeToPlanBody =>
      'Ещё есть время спланировать! Посмотрите длинные выходные.';

  @override
  String notifHolidayTomorrowTitle(String name) {
    return 'Завтра: $name 🎉';
  }

  @override
  String get notifEnjoyDayOffBody => 'Наслаждайтесь своим выходным!';

  @override
  String notifMonthlySummaryTitle(String month, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count праздника',
      many: '$count праздников',
      few: '$count праздника',
      one: '$count праздник',
    );
    return '$month: $_temp0';
  }

  @override
  String notifMonthlySummaryBody(String month) {
    return 'Откройте приложение и найдите лучшие длинные выходные в $month!';
  }

  @override
  String get notifChannelName => 'Напоминания о длинных выходных';

  @override
  String get notifChannelDescription =>
      'Напоминания для планирования отпуска на длинные выходные';

  @override
  String exportBridgeDaySummary(String holidays) {
    return 'Длинные выходные: $holidays';
  }

  @override
  String get exportBridgeDayTitle => 'Отпуск (длинные выходные)';

  @override
  String get removeAdsTitle => 'Убрать рекламу';

  @override
  String get removeAdsSubtitle => 'Заплатите один раз — навсегда без рекламы.';

  @override
  String buyForPrice(String price) {
    return 'Купить за $price';
  }

  @override
  String get buyNow => 'Купить';

  @override
  String get restorePurchases => 'Восстановить покупки';

  @override
  String get premiumActiveTitle => 'Режим без рекламы активен';

  @override
  String get premiumActiveSubtitle => 'Спасибо за поддержку!';

  @override
  String get purchaseError =>
      'Не удалось завершить покупку. Повторите попытку позже.';

  @override
  String get country => 'Страна';

  @override
  String get countryGermany => 'Германия';

  @override
  String get countryAustria => 'Австрия';

  @override
  String get countrySwitzerland => 'Швейцария';

  @override
  String get allCantons => 'Все кантоны';

  @override
  String get yourCanton => 'Ваш кантон';

  @override
  String get grenzgaengerMode => 'Приграничный режим';

  @override
  String get grenzgaengerModeSubtitle =>
      'Показывать праздники второго региона в календаре';

  @override
  String get offLabel => 'Выкл.';

  @override
  String holidayInRegion(String region) {
    return 'Праздник в регионе $region';
  }

  @override
  String notifNextYearBridgeTitle(int year) {
    return 'Мостовые дни $year уже здесь! 🎉';
  }

  @override
  String get notifNextYearBridgeBody =>
      'Спланируйте отпуск, пока лучшие дни не разобрали.';

  @override
  String get sourceAustriaLabel =>
      'Австрия: oesterreich.gv.at (официальный портал)';

  @override
  String get sourceSwitzerlandLabel => 'Швейцария: ch.ch (официальный портал)';
}
