import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('ru'),
    Locale('tr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In de, this message translates to:
  /// **'Feiertage Deutschland'**
  String get appTitle;

  /// No description provided for @holidays.
  ///
  /// In de, this message translates to:
  /// **'Feiertage'**
  String get holidays;

  /// No description provided for @bridgeDays.
  ///
  /// In de, this message translates to:
  /// **'Brückentage'**
  String get bridgeDays;

  /// No description provided for @allStates.
  ///
  /// In de, this message translates to:
  /// **'Alle Bundesländer'**
  String get allStates;

  /// No description provided for @state.
  ///
  /// In de, this message translates to:
  /// **'Bundesland'**
  String get state;

  /// No description provided for @year.
  ///
  /// In de, this message translates to:
  /// **'Jahr'**
  String get year;

  /// No description provided for @month.
  ///
  /// In de, this message translates to:
  /// **'Monat'**
  String get month;

  /// No description provided for @refresh.
  ///
  /// In de, this message translates to:
  /// **'Aktualisieren'**
  String get refresh;

  /// No description provided for @retry.
  ///
  /// In de, this message translates to:
  /// **'Erneut versuchen'**
  String get retry;

  /// No description provided for @errorOccurred.
  ///
  /// In de, this message translates to:
  /// **'Fehler aufgetreten'**
  String get errorOccurred;

  /// No description provided for @noHolidaysFound.
  ///
  /// In de, this message translates to:
  /// **'Keine Feiertage gefunden'**
  String get noHolidaysFound;

  /// No description provided for @noBridgeDaysFound.
  ///
  /// In de, this message translates to:
  /// **'Keine Brückentage gefunden'**
  String get noBridgeDaysFound;

  /// No description provided for @vacationDays.
  ///
  /// In de, this message translates to:
  /// **'Urlaubstage'**
  String get vacationDays;

  /// No description provided for @daysOff.
  ///
  /// In de, this message translates to:
  /// **'Tage frei'**
  String get daysOff;

  /// No description provided for @efficiency.
  ///
  /// In de, this message translates to:
  /// **'Effizienz'**
  String get efficiency;

  /// No description provided for @vacationRecommendation.
  ///
  /// In de, this message translates to:
  /// **'Urlaubsempfehlung'**
  String get vacationRecommendation;

  /// No description provided for @vacationDaysNeeded.
  ///
  /// In de, this message translates to:
  /// **'Urlaubstage benötigt'**
  String get vacationDaysNeeded;

  /// No description provided for @totalDaysOff.
  ///
  /// In de, this message translates to:
  /// **'Freie Tage insgesamt'**
  String get totalDaysOff;

  /// No description provided for @relatedHolidays.
  ///
  /// In de, this message translates to:
  /// **'Feiertage'**
  String get relatedHolidays;

  /// No description provided for @veryGood.
  ///
  /// In de, this message translates to:
  /// **'Sehr gut'**
  String get veryGood;

  /// No description provided for @good.
  ///
  /// In de, this message translates to:
  /// **'Gut'**
  String get good;

  /// No description provided for @okay.
  ///
  /// In de, this message translates to:
  /// **'Okay'**
  String get okay;

  /// No description provided for @low.
  ///
  /// In de, this message translates to:
  /// **'Niedrig'**
  String get low;

  /// No description provided for @january.
  ///
  /// In de, this message translates to:
  /// **'Januar'**
  String get january;

  /// No description provided for @february.
  ///
  /// In de, this message translates to:
  /// **'Februar'**
  String get february;

  /// No description provided for @march.
  ///
  /// In de, this message translates to:
  /// **'März'**
  String get march;

  /// No description provided for @april.
  ///
  /// In de, this message translates to:
  /// **'April'**
  String get april;

  /// No description provided for @may.
  ///
  /// In de, this message translates to:
  /// **'Mai'**
  String get may;

  /// No description provided for @june.
  ///
  /// In de, this message translates to:
  /// **'Juni'**
  String get june;

  /// No description provided for @july.
  ///
  /// In de, this message translates to:
  /// **'Juli'**
  String get july;

  /// No description provided for @august.
  ///
  /// In de, this message translates to:
  /// **'August'**
  String get august;

  /// No description provided for @september.
  ///
  /// In de, this message translates to:
  /// **'September'**
  String get september;

  /// No description provided for @october.
  ///
  /// In de, this message translates to:
  /// **'Oktober'**
  String get october;

  /// No description provided for @november.
  ///
  /// In de, this message translates to:
  /// **'November'**
  String get november;

  /// No description provided for @december.
  ///
  /// In de, this message translates to:
  /// **'Dezember'**
  String get december;

  /// No description provided for @bridgeDayLabel.
  ///
  /// In de, this message translates to:
  /// **'{days} Urlaubstage → {total} Tage frei'**
  String bridgeDayLabel(int days, int total);

  /// No description provided for @language.
  ///
  /// In de, this message translates to:
  /// **'Sprache'**
  String get language;

  /// No description provided for @settings.
  ///
  /// In de, this message translates to:
  /// **'Einstellungen'**
  String get settings;

  /// No description provided for @systemDefault.
  ///
  /// In de, this message translates to:
  /// **'Systemsprache'**
  String get systemDefault;

  /// No description provided for @aboutApp.
  ///
  /// In de, this message translates to:
  /// **'Über diese App'**
  String get aboutApp;

  /// No description provided for @importantInfoHeader.
  ///
  /// In de, this message translates to:
  /// **'⚠️ WICHTIGE INFORMATIONEN'**
  String get importantInfoHeader;

  /// No description provided for @disclaimerBody.
  ///
  /// In de, this message translates to:
  /// **'Diese App ist KEINE offizielle Regierungsanwendung und steht in keiner Verbindung zu staatlichen Stellen. Es handelt sich um ein unabhängiges, privates Informationsangebot. Für verbindliche Informationen wenden Sie sich bitte direkt an die zuständigen Behörden.'**
  String get disclaimerBody;

  /// No description provided for @dataSource.
  ///
  /// In de, this message translates to:
  /// **'Datenquelle'**
  String get dataSource;

  /// No description provided for @dataSourceBody.
  ///
  /// In de, this message translates to:
  /// **'Die Feiertagsdaten basieren auf offiziellen gesetzlichen Regelungen der Bundesrepublik Deutschland. Maßgebliche Quellen sind:'**
  String get dataSourceBody;

  /// No description provided for @sourceBmiLabel.
  ///
  /// In de, this message translates to:
  /// **'BMI – Nationale Feiertage'**
  String get sourceBmiLabel;

  /// No description provided for @technicalImplementation.
  ///
  /// In de, this message translates to:
  /// **'Technische Umsetzung'**
  String get technicalImplementation;

  /// No description provided for @technicalImplementationBody.
  ///
  /// In de, this message translates to:
  /// **'Zur technischen Bereitstellung der Daten wird die OpenHolidays API genutzt, die Feiertagsinformationen aus den oben genannten offiziellen Quellen aggregiert.'**
  String get technicalImplementationBody;

  /// No description provided for @sourceOpenHolidaysLabel.
  ///
  /// In de, this message translates to:
  /// **'OpenHolidays API'**
  String get sourceOpenHolidaysLabel;

  /// No description provided for @privacyPolicy.
  ///
  /// In de, this message translates to:
  /// **'Datenschutz'**
  String get privacyPolicy;

  /// No description provided for @close.
  ///
  /// In de, this message translates to:
  /// **'Schließen'**
  String get close;

  /// No description provided for @yearOverview.
  ///
  /// In de, this message translates to:
  /// **'Jahresübersicht'**
  String get yearOverview;

  /// No description provided for @notifications.
  ///
  /// In de, this message translates to:
  /// **'Benachrichtigungen'**
  String get notifications;

  /// No description provided for @dDayLabel.
  ///
  /// In de, this message translates to:
  /// **'D-{days}'**
  String dDayLabel(int days);

  /// No description provided for @tomorrowIsHoliday.
  ///
  /// In de, this message translates to:
  /// **'Morgen ist Feiertag'**
  String get tomorrowIsHoliday;

  /// No description provided for @daysRemaining.
  ///
  /// In de, this message translates to:
  /// **'Noch {days} Tage'**
  String daysRemaining(int days);

  /// No description provided for @tomorrowVacationStarts.
  ///
  /// In de, this message translates to:
  /// **'Morgen beginnt der Urlaub'**
  String get tomorrowVacationStarts;

  /// No description provided for @onboardingHeadline.
  ///
  /// In de, this message translates to:
  /// **'1 Tag Urlaub.\n4 Tage frei.'**
  String get onboardingHeadline;

  /// No description provided for @onboardingSubtitle.
  ///
  /// In de, this message translates to:
  /// **'Finde die besten Brückentage in deinem Bundesland und maximiere deinen Urlaub.'**
  String get onboardingSubtitle;

  /// No description provided for @featureAllHolidays.
  ///
  /// In de, this message translates to:
  /// **'Alle Feiertage auf einen Blick'**
  String get featureAllHolidays;

  /// No description provided for @featureSmartBridgeDays.
  ///
  /// In de, this message translates to:
  /// **'Smarte Brückentage-Empfehlungen'**
  String get featureSmartBridgeDays;

  /// No description provided for @featureReminders.
  ///
  /// In de, this message translates to:
  /// **'Erinnerungen vor Brückentagen'**
  String get featureReminders;

  /// No description provided for @letsGo.
  ///
  /// In de, this message translates to:
  /// **'Los geht\'s'**
  String get letsGo;

  /// No description provided for @yourState.
  ///
  /// In de, this message translates to:
  /// **'Dein Bundesland'**
  String get yourState;

  /// No description provided for @stateSelectionSubtitle.
  ///
  /// In de, this message translates to:
  /// **'Feiertage unterscheiden sich je nach Bundesland. Wähle deins aus.'**
  String get stateSelectionSubtitle;

  /// No description provided for @next.
  ///
  /// In de, this message translates to:
  /// **'Weiter'**
  String get next;

  /// No description provided for @almostDone.
  ///
  /// In de, this message translates to:
  /// **'Fast fertig!'**
  String get almostDone;

  /// No description provided for @vacationDaysPerYear.
  ///
  /// In de, this message translates to:
  /// **'Urlaubstage pro Jahr'**
  String get vacationDaysPerYear;

  /// No description provided for @howManyVacationDays.
  ///
  /// In de, this message translates to:
  /// **'Wie viele Urlaubstage hast du?'**
  String get howManyVacationDays;

  /// No description provided for @bridgeDayReminders.
  ///
  /// In de, this message translates to:
  /// **'Brückentage Erinnerungen'**
  String get bridgeDayReminders;

  /// No description provided for @bridgeDayRemindersSubtitle.
  ///
  /// In de, this message translates to:
  /// **'Werde vor optimalen Brückentagen benachrichtigt'**
  String get bridgeDayRemindersSubtitle;

  /// No description provided for @showSchoolHolidays.
  ///
  /// In de, this message translates to:
  /// **'Schulferien anzeigen'**
  String get showSchoolHolidays;

  /// No description provided for @showSchoolHolidaysSubtitleShort.
  ///
  /// In de, this message translates to:
  /// **'Schulferien deines Bundeslandes im Kalender'**
  String get showSchoolHolidaysSubtitleShort;

  /// No description provided for @done.
  ///
  /// In de, this message translates to:
  /// **'Fertig'**
  String get done;

  /// No description provided for @previousYear.
  ///
  /// In de, this message translates to:
  /// **'Vorheriges Jahr'**
  String get previousYear;

  /// No description provided for @nextYear.
  ///
  /// In de, this message translates to:
  /// **'Nächstes Jahr'**
  String get nextYear;

  /// No description provided for @nationwide.
  ///
  /// In de, this message translates to:
  /// **'Bundesweit'**
  String get nationwide;

  /// No description provided for @regional.
  ///
  /// In de, this message translates to:
  /// **'Regional'**
  String get regional;

  /// No description provided for @additionalDaysOff.
  ///
  /// In de, this message translates to:
  /// **'Zusätzlich frei'**
  String get additionalDaysOff;

  /// No description provided for @bridgeDaysWithYear.
  ///
  /// In de, this message translates to:
  /// **'Brückentage {year}'**
  String bridgeDaysWithYear(int year);

  /// No description provided for @daysCount.
  ///
  /// In de, this message translates to:
  /// **'{count} Tage'**
  String daysCount(int count);

  /// No description provided for @calendarExportFailed.
  ///
  /// In de, this message translates to:
  /// **'Kalender-Export konnte nicht geöffnet werden.'**
  String get calendarExportFailed;

  /// No description provided for @addToCalendar.
  ///
  /// In de, this message translates to:
  /// **'Zum Kalender hinzufügen'**
  String get addToCalendar;

  /// No description provided for @notificationHeaderSubtitle.
  ///
  /// In de, this message translates to:
  /// **'Werde rechtzeitig an optimale Urlaubstage erinnert'**
  String get notificationHeaderSubtitle;

  /// No description provided for @notificationsNotSupported.
  ///
  /// In de, this message translates to:
  /// **'Benachrichtigungen werden auf dieser Plattform nicht unterstützt.'**
  String get notificationsNotSupported;

  /// No description provided for @bridgeDayNotifications.
  ///
  /// In de, this message translates to:
  /// **'Brückentage Benachrichtigungen'**
  String get bridgeDayNotifications;

  /// No description provided for @bridgeDayNotificationsSubtitle.
  ///
  /// In de, this message translates to:
  /// **'Erhalte Erinnerungen vor optimalen Urlaubstagen'**
  String get bridgeDayNotificationsSubtitle;

  /// No description provided for @holidayReminders.
  ///
  /// In de, this message translates to:
  /// **'Feiertag-Erinnerungen'**
  String get holidayReminders;

  /// No description provided for @holidayRemindersSubtitle.
  ///
  /// In de, this message translates to:
  /// **'7 Tage und 1 Tag vor jedem Feiertag erinnern'**
  String get holidayRemindersSubtitle;

  /// No description provided for @remindBefore.
  ///
  /// In de, this message translates to:
  /// **'Erinnerung vor'**
  String get remindBefore;

  /// No description provided for @daysBefore.
  ///
  /// In de, this message translates to:
  /// **'{days} Tage vorher'**
  String daysBefore(int days);

  /// No description provided for @monthlySummary.
  ///
  /// In de, this message translates to:
  /// **'Monatliche Zusammenfassung'**
  String get monthlySummary;

  /// No description provided for @monthlySummarySubtitle.
  ///
  /// In de, this message translates to:
  /// **'Am 1. jeden Monats eine Übersicht der Feiertage erhalten'**
  String get monthlySummarySubtitle;

  /// No description provided for @calendar.
  ///
  /// In de, this message translates to:
  /// **'Kalender'**
  String get calendar;

  /// No description provided for @showSchoolHolidaysSubtitle.
  ///
  /// In de, this message translates to:
  /// **'Schulferien deines Bundeslandes im Kalender anzeigen'**
  String get showSchoolHolidaysSubtitle;

  /// No description provided for @howItWorks.
  ///
  /// In de, this message translates to:
  /// **'So funktioniert es'**
  String get howItWorks;

  /// No description provided for @autoDetectionTitle.
  ///
  /// In de, this message translates to:
  /// **'Automatische Erkennung'**
  String get autoDetectionTitle;

  /// No description provided for @autoDetectionBody.
  ///
  /// In de, this message translates to:
  /// **'Die App findet die besten Brückentage basierend auf deinem Bundesland.'**
  String get autoDetectionBody;

  /// No description provided for @timelyReminderTitle.
  ///
  /// In de, this message translates to:
  /// **'Rechtzeitige Erinnerung'**
  String get timelyReminderTitle;

  /// No description provided for @timelyReminderBody.
  ///
  /// In de, this message translates to:
  /// **'Du wirst rechtzeitig vor dem optimalen Zeitraum benachrichtigt.'**
  String get timelyReminderBody;

  /// No description provided for @moreVacationTitle.
  ///
  /// In de, this message translates to:
  /// **'Mehr Urlaub'**
  String get moreVacationTitle;

  /// No description provided for @moreVacationBody.
  ///
  /// In de, this message translates to:
  /// **'Nutze wenige Urlaubstage für maximale freie Zeit!'**
  String get moreVacationBody;

  /// No description provided for @errorLoadingSettings.
  ///
  /// In de, this message translates to:
  /// **'Fehler beim Laden der Einstellungen'**
  String get errorLoadingSettings;

  /// No description provided for @cancel.
  ///
  /// In de, this message translates to:
  /// **'Abbrechen'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In de, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @selectState.
  ///
  /// In de, this message translates to:
  /// **'Bundesland auswählen'**
  String get selectState;

  /// No description provided for @selectYearAndMonth.
  ///
  /// In de, this message translates to:
  /// **'Jahr und Monat auswählen'**
  String get selectYearAndMonth;

  /// No description provided for @bridgeDayTips.
  ///
  /// In de, this message translates to:
  /// **'Brückentage Tipps'**
  String get bridgeDayTips;

  /// No description provided for @showAll.
  ///
  /// In de, this message translates to:
  /// **'Alle anzeigen'**
  String get showAll;

  /// No description provided for @vacationToDaysOff.
  ///
  /// In de, this message translates to:
  /// **'{vacationDays} → {totalDaysOff} Tage'**
  String vacationToDaysOff(int vacationDays, int totalDaysOff);

  /// No description provided for @vacationSettings.
  ///
  /// In de, this message translates to:
  /// **'Urlaubseinstellungen'**
  String get vacationSettings;

  /// No description provided for @annualVacationDays.
  ///
  /// In de, this message translates to:
  /// **'Jahresurlaub (Tage)'**
  String get annualVacationDays;

  /// No description provided for @remainingVacationReminder.
  ///
  /// In de, this message translates to:
  /// **'Resturlaub-Erinnerung'**
  String get remainingVacationReminder;

  /// No description provided for @redeemByMarch31.
  ///
  /// In de, this message translates to:
  /// **'Bis 31. März einlösen'**
  String get redeemByMarch31;

  /// No description provided for @save.
  ///
  /// In de, this message translates to:
  /// **'Speichern'**
  String get save;

  /// No description provided for @vacationEntitlement.
  ///
  /// In de, this message translates to:
  /// **'Urlaubsanspruch'**
  String get vacationEntitlement;

  /// No description provided for @edit.
  ///
  /// In de, this message translates to:
  /// **'Bearbeiten'**
  String get edit;

  /// No description provided for @daysTakenOfTotal.
  ///
  /// In de, this message translates to:
  /// **'{used} von {total} Tagen genommen'**
  String daysTakenOfTotal(int used, int total);

  /// No description provided for @daysRemainingCount.
  ///
  /// In de, this message translates to:
  /// **'{count} Tage übrig'**
  String daysRemainingCount(int count);

  /// No description provided for @bestVacationEfficiency.
  ///
  /// In de, this message translates to:
  /// **'Beste Urlaubseffizienz'**
  String get bestVacationEfficiency;

  /// No description provided for @noBridgeDaysAvailable.
  ///
  /// In de, this message translates to:
  /// **'Keine Brückentage verfügbar'**
  String get noBridgeDaysAvailable;

  /// No description provided for @oneVacationDayEquals.
  ///
  /// In de, this message translates to:
  /// **'1 Urlaubstag = {totalDaysOff} freie Tage'**
  String oneVacationDayEquals(int totalDaysOff);

  /// No description provided for @legalHoliday.
  ///
  /// In de, this message translates to:
  /// **'Gesetzlicher Feiertag'**
  String get legalHoliday;

  /// No description provided for @noHoliday.
  ///
  /// In de, this message translates to:
  /// **'Kein Feiertag'**
  String get noHoliday;

  /// No description provided for @durationDaysParen.
  ///
  /// In de, this message translates to:
  /// **'({count} Tage)'**
  String durationDaysParen(int count);

  /// No description provided for @addVacation.
  ///
  /// In de, this message translates to:
  /// **'Urlaub eintragen'**
  String get addVacation;

  /// No description provided for @moreHolidays.
  ///
  /// In de, this message translates to:
  /// **'Weitere Feiertage'**
  String get moreHolidays;

  /// No description provided for @addedToCalendar.
  ///
  /// In de, this message translates to:
  /// **'{name} wird zum Kalender hinzugefügt'**
  String addedToCalendar(String name);

  /// No description provided for @takeMondayOff.
  ///
  /// In de, this message translates to:
  /// **'Montag Urlaub nehmen'**
  String get takeMondayOff;

  /// No description provided for @takeFridayOff.
  ///
  /// In de, this message translates to:
  /// **'Freitag Urlaub nehmen'**
  String get takeFridayOff;

  /// No description provided for @fourDaysOffPossible.
  ///
  /// In de, this message translates to:
  /// **'→ 4 Tage frei möglich!'**
  String get fourDaysOffPossible;

  /// No description provided for @bridgeDayTip.
  ///
  /// In de, this message translates to:
  /// **'Brückentag Tipp'**
  String get bridgeDayTip;

  /// No description provided for @calendarWeekNumber.
  ///
  /// In de, this message translates to:
  /// **'KW{week}'**
  String calendarWeekNumber(int week);

  /// No description provided for @labelOptional.
  ///
  /// In de, this message translates to:
  /// **'Bezeichnung (optional)'**
  String get labelOptional;

  /// No description provided for @from.
  ///
  /// In de, this message translates to:
  /// **'Von'**
  String get from;

  /// No description provided for @to.
  ///
  /// In de, this message translates to:
  /// **'Bis'**
  String get to;

  /// No description provided for @vacationDefaultTitle.
  ///
  /// In de, this message translates to:
  /// **'Urlaub'**
  String get vacationDefaultTitle;

  /// No description provided for @adLabel.
  ///
  /// In de, this message translates to:
  /// **'Anzeige'**
  String get adLabel;

  /// No description provided for @monday.
  ///
  /// In de, this message translates to:
  /// **'Montag'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In de, this message translates to:
  /// **'Dienstag'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In de, this message translates to:
  /// **'Mittwoch'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In de, this message translates to:
  /// **'Donnerstag'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In de, this message translates to:
  /// **'Freitag'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In de, this message translates to:
  /// **'Samstag'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In de, this message translates to:
  /// **'Sonntag'**
  String get sunday;

  /// No description provided for @notifHolidayInDaysTitle.
  ///
  /// In de, this message translates to:
  /// **'Nächster Feiertag in {days} Tagen!'**
  String notifHolidayInDaysTitle(int days);

  /// No description provided for @notifPlanNowBody.
  ///
  /// In de, this message translates to:
  /// **'Plane jetzt deine Brückentage und maximiere deinen Urlaub.'**
  String get notifPlanNowBody;

  /// No description provided for @notifRemainingBridgeTitle.
  ///
  /// In de, this message translates to:
  /// **'Noch {count} Brückentage in {year}'**
  String notifRemainingBridgeTitle(int count, int year);

  /// No description provided for @notifPlanBestBody.
  ///
  /// In de, this message translates to:
  /// **'Jetzt planen und das Beste aus deinem Urlaub herausholen!'**
  String get notifPlanBestBody;

  /// No description provided for @notifNextHolidayTitle.
  ///
  /// In de, this message translates to:
  /// **'Nächster Feiertag'**
  String get notifNextHolidayTitle;

  /// No description provided for @notifNextHolidayBody.
  ///
  /// In de, this message translates to:
  /// **'{date} — {name}. App öffnen für Brückentage-Tipps!'**
  String notifNextHolidayBody(String date, String name);

  /// No description provided for @notifHolidayIn7DaysTitle.
  ///
  /// In de, this message translates to:
  /// **'In 7 Tagen: {name}'**
  String notifHolidayIn7DaysTitle(String name);

  /// No description provided for @notifTimeToPlanBody.
  ///
  /// In de, this message translates to:
  /// **'Noch Zeit zum Planen! Schau dir die Brückentage an.'**
  String get notifTimeToPlanBody;

  /// No description provided for @notifHolidayTomorrowTitle.
  ///
  /// In de, this message translates to:
  /// **'Morgen: {name} 🎉'**
  String notifHolidayTomorrowTitle(String name);

  /// No description provided for @notifEnjoyDayOffBody.
  ///
  /// In de, this message translates to:
  /// **'Genieße deinen freien Tag!'**
  String get notifEnjoyDayOffBody;

  /// No description provided for @notifMonthlySummaryTitle.
  ///
  /// In de, this message translates to:
  /// **'{month}: {count, plural, one{{count} Feiertag} other{{count} Feiertage}}'**
  String notifMonthlySummaryTitle(String month, int count);

  /// No description provided for @notifMonthlySummaryBody.
  ///
  /// In de, this message translates to:
  /// **'Öffne die App und finde die besten Brückentage im {month}!'**
  String notifMonthlySummaryBody(String month);

  /// No description provided for @notifChannelName.
  ///
  /// In de, this message translates to:
  /// **'Brückentage Erinnerungen'**
  String get notifChannelName;

  /// No description provided for @notifChannelDescription.
  ///
  /// In de, this message translates to:
  /// **'Erinnerungen für Brückentage Urlaubsplanung'**
  String get notifChannelDescription;

  /// No description provided for @exportBridgeDaySummary.
  ///
  /// In de, this message translates to:
  /// **'Brückentage: {holidays}'**
  String exportBridgeDaySummary(String holidays);

  /// No description provided for @exportBridgeDayTitle.
  ///
  /// In de, this message translates to:
  /// **'Urlaub (Brückentag)'**
  String get exportBridgeDayTitle;

  /// No description provided for @removeAdsTitle.
  ///
  /// In de, this message translates to:
  /// **'Werbung entfernen'**
  String get removeAdsTitle;

  /// No description provided for @removeAdsSubtitle.
  ///
  /// In de, this message translates to:
  /// **'Einmalig zahlen, für immer werbefrei.'**
  String get removeAdsSubtitle;

  /// No description provided for @buyForPrice.
  ///
  /// In de, this message translates to:
  /// **'Für {price} kaufen'**
  String buyForPrice(String price);

  /// No description provided for @buyNow.
  ///
  /// In de, this message translates to:
  /// **'Jetzt kaufen'**
  String get buyNow;

  /// No description provided for @restorePurchases.
  ///
  /// In de, this message translates to:
  /// **'Käufe wiederherstellen'**
  String get restorePurchases;

  /// No description provided for @premiumActiveTitle.
  ///
  /// In de, this message translates to:
  /// **'Werbefrei aktiv'**
  String get premiumActiveTitle;

  /// No description provided for @premiumActiveSubtitle.
  ///
  /// In de, this message translates to:
  /// **'Danke für deine Unterstützung!'**
  String get premiumActiveSubtitle;

  /// No description provided for @purchaseError.
  ///
  /// In de, this message translates to:
  /// **'Kauf konnte nicht abgeschlossen werden. Bitte später erneut versuchen.'**
  String get purchaseError;

  /// No description provided for @country.
  ///
  /// In de, this message translates to:
  /// **'Land'**
  String get country;

  /// No description provided for @countryGermany.
  ///
  /// In de, this message translates to:
  /// **'Deutschland'**
  String get countryGermany;

  /// No description provided for @countryAustria.
  ///
  /// In de, this message translates to:
  /// **'Österreich'**
  String get countryAustria;

  /// No description provided for @countrySwitzerland.
  ///
  /// In de, this message translates to:
  /// **'Schweiz'**
  String get countrySwitzerland;

  /// No description provided for @allCantons.
  ///
  /// In de, this message translates to:
  /// **'Alle Kantone'**
  String get allCantons;

  /// No description provided for @yourCanton.
  ///
  /// In de, this message translates to:
  /// **'Dein Kanton'**
  String get yourCanton;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'de', 'en', 'ru', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
