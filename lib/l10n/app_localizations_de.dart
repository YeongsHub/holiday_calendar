// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Feiertage DE AT CH';

  @override
  String get holidays => 'Feiertage';

  @override
  String get bridgeDays => 'Brückentage';

  @override
  String get allStates => 'Alle Bundesländer';

  @override
  String get state => 'Bundesland';

  @override
  String get year => 'Jahr';

  @override
  String get month => 'Monat';

  @override
  String get refresh => 'Aktualisieren';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get errorOccurred => 'Fehler aufgetreten';

  @override
  String get noHolidaysFound => 'Keine Feiertage gefunden';

  @override
  String get noBridgeDaysFound => 'Keine Brückentage gefunden';

  @override
  String get vacationDays => 'Urlaubstage';

  @override
  String get daysOff => 'Tage frei';

  @override
  String get efficiency => 'Effizienz';

  @override
  String get vacationRecommendation => 'Urlaubsempfehlung';

  @override
  String get vacationDaysNeeded => 'Urlaubstage benötigt';

  @override
  String get totalDaysOff => 'Freie Tage insgesamt';

  @override
  String get relatedHolidays => 'Feiertage';

  @override
  String get veryGood => 'Sehr gut';

  @override
  String get good => 'Gut';

  @override
  String get okay => 'Okay';

  @override
  String get low => 'Niedrig';

  @override
  String get january => 'Januar';

  @override
  String get february => 'Februar';

  @override
  String get march => 'März';

  @override
  String get april => 'April';

  @override
  String get may => 'Mai';

  @override
  String get june => 'Juni';

  @override
  String get july => 'Juli';

  @override
  String get august => 'August';

  @override
  String get september => 'September';

  @override
  String get october => 'Oktober';

  @override
  String get november => 'November';

  @override
  String get december => 'Dezember';

  @override
  String bridgeDayLabel(int days, int total) {
    return '$days Urlaubstage → $total Tage frei';
  }

  @override
  String get language => 'Sprache';

  @override
  String get settings => 'Einstellungen';

  @override
  String get systemDefault => 'Systemsprache';

  @override
  String get aboutApp => 'Über diese App';

  @override
  String get importantInfoHeader => '⚠️ WICHTIGE INFORMATIONEN';

  @override
  String get disclaimerBody =>
      'Diese App ist KEINE offizielle Regierungsanwendung und steht in keiner Verbindung zu staatlichen Stellen. Es handelt sich um ein unabhängiges, privates Informationsangebot. Für verbindliche Informationen wenden Sie sich bitte direkt an die zuständigen Behörden.';

  @override
  String get dataSource => 'Datenquelle';

  @override
  String get dataSourceBody =>
      'Die Feiertagsdaten basieren auf den amtlichen Veröffentlichungen von Deutschland, Österreich und der Schweiz. Maßgebliche Quellen sind:';

  @override
  String get sourceBmiLabel => 'BMI – Nationale Feiertage';

  @override
  String get technicalImplementation => 'Technische Umsetzung';

  @override
  String get technicalImplementationBody =>
      'Zur technischen Bereitstellung der Daten wird die OpenHolidays API genutzt, die Feiertagsinformationen aus den oben genannten offiziellen Quellen aggregiert.';

  @override
  String get sourceOpenHolidaysLabel => 'OpenHolidays API';

  @override
  String get privacyPolicy => 'Datenschutz';

  @override
  String get close => 'Schließen';

  @override
  String get yearOverview => 'Jahresübersicht';

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String dDayLabel(int days) {
    return 'D-$days';
  }

  @override
  String get tomorrowIsHoliday => 'Morgen ist Feiertag';

  @override
  String daysRemaining(int days) {
    return 'Noch $days Tage';
  }

  @override
  String get tomorrowVacationStarts => 'Morgen beginnt der Urlaub';

  @override
  String get onboardingHeadline => '1 Tag Urlaub.\n4 Tage frei.';

  @override
  String get onboardingSubtitle =>
      'Finde die besten Brückentage in deinem Bundesland und maximiere deinen Urlaub.';

  @override
  String get featureAllHolidays => 'Alle Feiertage auf einen Blick';

  @override
  String get featureSmartBridgeDays => 'Smarte Brückentage-Empfehlungen';

  @override
  String get featureReminders => 'Erinnerungen vor Brückentagen';

  @override
  String get letsGo => 'Los geht\'s';

  @override
  String get yourState => 'Dein Bundesland';

  @override
  String get stateSelectionSubtitle =>
      'Feiertage unterscheiden sich je nach Bundesland. Wähle deins aus.';

  @override
  String get next => 'Weiter';

  @override
  String get almostDone => 'Fast fertig!';

  @override
  String get vacationDaysPerYear => 'Urlaubstage pro Jahr';

  @override
  String get howManyVacationDays => 'Wie viele Urlaubstage hast du?';

  @override
  String get bridgeDayReminders => 'Brückentage Erinnerungen';

  @override
  String get bridgeDayRemindersSubtitle =>
      'Werde vor optimalen Brückentagen benachrichtigt';

  @override
  String get showSchoolHolidays => 'Schulferien anzeigen';

  @override
  String get showSchoolHolidaysSubtitleShort =>
      'Schulferien deines Bundeslandes im Kalender';

  @override
  String get done => 'Fertig';

  @override
  String get previousYear => 'Vorheriges Jahr';

  @override
  String get nextYear => 'Nächstes Jahr';

  @override
  String get nationwide => 'Bundesweit';

  @override
  String get regional => 'Regional';

  @override
  String get additionalDaysOff => 'Zusätzlich frei';

  @override
  String bridgeDaysWithYear(int year) {
    return 'Brückentage $year';
  }

  @override
  String daysCount(int count) {
    return '$count Tage';
  }

  @override
  String get calendarExportFailed =>
      'Kalender-Export konnte nicht geöffnet werden.';

  @override
  String get addToCalendar => 'Zum Kalender hinzufügen';

  @override
  String get notificationHeaderSubtitle =>
      'Werde rechtzeitig an optimale Urlaubstage erinnert';

  @override
  String get notificationsNotSupported =>
      'Benachrichtigungen werden auf dieser Plattform nicht unterstützt.';

  @override
  String get bridgeDayNotifications => 'Brückentage Benachrichtigungen';

  @override
  String get bridgeDayNotificationsSubtitle =>
      'Erhalte Erinnerungen vor optimalen Urlaubstagen';

  @override
  String get holidayReminders => 'Feiertag-Erinnerungen';

  @override
  String get holidayRemindersSubtitle =>
      '7 Tage und 1 Tag vor jedem Feiertag erinnern';

  @override
  String get remindBefore => 'Erinnerung vor';

  @override
  String daysBefore(int days) {
    return '$days Tage vorher';
  }

  @override
  String get monthlySummary => 'Monatliche Zusammenfassung';

  @override
  String get monthlySummarySubtitle =>
      'Am 1. jeden Monats eine Übersicht der Feiertage erhalten';

  @override
  String get calendar => 'Kalender';

  @override
  String get showSchoolHolidaysSubtitle =>
      'Schulferien deines Bundeslandes im Kalender anzeigen';

  @override
  String get howItWorks => 'So funktioniert es';

  @override
  String get autoDetectionTitle => 'Automatische Erkennung';

  @override
  String get autoDetectionBody =>
      'Die App findet die besten Brückentage basierend auf deinem Bundesland.';

  @override
  String get timelyReminderTitle => 'Rechtzeitige Erinnerung';

  @override
  String get timelyReminderBody =>
      'Du wirst rechtzeitig vor dem optimalen Zeitraum benachrichtigt.';

  @override
  String get moreVacationTitle => 'Mehr Urlaub';

  @override
  String get moreVacationBody =>
      'Nutze wenige Urlaubstage für maximale freie Zeit!';

  @override
  String get errorLoadingSettings => 'Fehler beim Laden der Einstellungen';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get ok => 'OK';

  @override
  String get selectState => 'Bundesland auswählen';

  @override
  String get selectYearAndMonth => 'Jahr und Monat auswählen';

  @override
  String get bridgeDayTips => 'Brückentage Tipps';

  @override
  String get showAll => 'Alle anzeigen';

  @override
  String vacationToDaysOff(int vacationDays, int totalDaysOff) {
    return '$vacationDays → $totalDaysOff Tage';
  }

  @override
  String get vacationSettings => 'Urlaubseinstellungen';

  @override
  String get annualVacationDays => 'Jahresurlaub (Tage)';

  @override
  String get remainingVacationReminder => 'Resturlaub-Erinnerung';

  @override
  String get redeemByMarch31 => 'Bis 31. März einlösen';

  @override
  String get save => 'Speichern';

  @override
  String get vacationEntitlement => 'Urlaubsanspruch';

  @override
  String get edit => 'Bearbeiten';

  @override
  String daysTakenOfTotal(int used, int total) {
    return '$used von $total Tagen genommen';
  }

  @override
  String daysRemainingCount(int count) {
    return '$count Tage übrig';
  }

  @override
  String get bestVacationEfficiency => 'Beste Urlaubseffizienz';

  @override
  String get noBridgeDaysAvailable => 'Keine Brückentage verfügbar';

  @override
  String oneVacationDayEquals(int totalDaysOff) {
    return '1 Urlaubstag = $totalDaysOff freie Tage';
  }

  @override
  String get legalHoliday => 'Gesetzlicher Feiertag';

  @override
  String get noHoliday => 'Kein Feiertag';

  @override
  String durationDaysParen(int count) {
    return '($count Tage)';
  }

  @override
  String get addVacation => 'Urlaub eintragen';

  @override
  String get moreHolidays => 'Weitere Feiertage';

  @override
  String addedToCalendar(String name) {
    return '$name wird zum Kalender hinzugefügt';
  }

  @override
  String get takeMondayOff => 'Montag Urlaub nehmen';

  @override
  String get takeFridayOff => 'Freitag Urlaub nehmen';

  @override
  String get fourDaysOffPossible => '→ 4 Tage frei möglich!';

  @override
  String get bridgeDayTip => 'Brückentag Tipp';

  @override
  String calendarWeekNumber(int week) {
    return 'KW$week';
  }

  @override
  String get labelOptional => 'Bezeichnung (optional)';

  @override
  String get from => 'Von';

  @override
  String get to => 'Bis';

  @override
  String get vacationDefaultTitle => 'Urlaub';

  @override
  String get adLabel => 'Anzeige';

  @override
  String get monday => 'Montag';

  @override
  String get tuesday => 'Dienstag';

  @override
  String get wednesday => 'Mittwoch';

  @override
  String get thursday => 'Donnerstag';

  @override
  String get friday => 'Freitag';

  @override
  String get saturday => 'Samstag';

  @override
  String get sunday => 'Sonntag';

  @override
  String notifHolidayInDaysTitle(int days) {
    return 'Nächster Feiertag in $days Tagen!';
  }

  @override
  String get notifPlanNowBody =>
      'Plane jetzt deine Brückentage und maximiere deinen Urlaub.';

  @override
  String notifRemainingBridgeTitle(int count, int year) {
    return 'Noch $count Brückentage in $year';
  }

  @override
  String get notifPlanBestBody =>
      'Jetzt planen und das Beste aus deinem Urlaub herausholen!';

  @override
  String get notifNextHolidayTitle => 'Nächster Feiertag';

  @override
  String notifNextHolidayBody(String date, String name) {
    return '$date — $name. App öffnen für Brückentage-Tipps!';
  }

  @override
  String notifHolidayIn7DaysTitle(String name) {
    return 'In 7 Tagen: $name';
  }

  @override
  String get notifTimeToPlanBody =>
      'Noch Zeit zum Planen! Schau dir die Brückentage an.';

  @override
  String notifHolidayTomorrowTitle(String name) {
    return 'Morgen: $name 🎉';
  }

  @override
  String get notifEnjoyDayOffBody => 'Genieße deinen freien Tag!';

  @override
  String notifMonthlySummaryTitle(String month, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Feiertage',
      one: '$count Feiertag',
    );
    return '$month: $_temp0';
  }

  @override
  String notifMonthlySummaryBody(String month) {
    return 'Öffne die App und finde die besten Brückentage im $month!';
  }

  @override
  String get notifChannelName => 'Brückentage Erinnerungen';

  @override
  String get notifChannelDescription =>
      'Erinnerungen für Brückentage Urlaubsplanung';

  @override
  String exportBridgeDaySummary(String holidays) {
    return 'Brückentage: $holidays';
  }

  @override
  String get exportBridgeDayTitle => 'Urlaub (Brückentag)';

  @override
  String get removeAdsTitle => 'Werbung entfernen';

  @override
  String get removeAdsSubtitle => 'Einmalig zahlen, für immer werbefrei.';

  @override
  String buyForPrice(String price) {
    return 'Für $price kaufen';
  }

  @override
  String get buyNow => 'Jetzt kaufen';

  @override
  String get restorePurchases => 'Käufe wiederherstellen';

  @override
  String get premiumActiveTitle => 'Werbefrei aktiv';

  @override
  String get premiumActiveSubtitle => 'Danke für deine Unterstützung!';

  @override
  String get purchaseError =>
      'Kauf konnte nicht abgeschlossen werden. Bitte später erneut versuchen.';

  @override
  String get country => 'Land';

  @override
  String get countryGermany => 'Deutschland';

  @override
  String get countryAustria => 'Österreich';

  @override
  String get countrySwitzerland => 'Schweiz';

  @override
  String get allCantons => 'Alle Kantone';

  @override
  String get yourCanton => 'Dein Kanton';

  @override
  String get grenzgaengerMode => 'Grenzgänger-Modus';

  @override
  String get grenzgaengerModeSubtitle =>
      'Feiertage einer zweiten Region im Kalender anzeigen';

  @override
  String get offLabel => 'Aus';

  @override
  String holidayInRegion(String region) {
    return 'Feiertag in $region';
  }

  @override
  String notifNextYearBridgeTitle(int year) {
    return 'Die Brückentage $year sind da! 🎉';
  }

  @override
  String get notifNextYearBridgeBody =>
      'Plane jetzt deinen Urlaub, bevor die besten Tage vergeben sind.';

  @override
  String get sourceAustriaLabel =>
      'Österreich: oesterreich.gv.at (amtliches Portal)';

  @override
  String get sourceSwitzerlandLabel =>
      'Schweiz: ch.ch (Portal von Bund und Kantonen)';
}
