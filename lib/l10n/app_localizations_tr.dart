// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Almanya Resmi Tatilleri';

  @override
  String get holidays => 'Resmi tatiller';

  @override
  String get bridgeDays => 'Köprü günleri';

  @override
  String get allStates => 'Tüm eyaletler';

  @override
  String get state => 'Eyalet';

  @override
  String get year => 'Yıl';

  @override
  String get month => 'Ay';

  @override
  String get refresh => 'Yenile';

  @override
  String get retry => 'Tekrar dene';

  @override
  String get errorOccurred => 'Hata oluştu';

  @override
  String get noHolidaysFound => 'Resmi tatil bulunamadı';

  @override
  String get noBridgeDaysFound => 'Köprü günü bulunamadı';

  @override
  String get vacationDays => 'İzin günleri';

  @override
  String get daysOff => 'İzinli gün';

  @override
  String get efficiency => 'Verimlilik';

  @override
  String get vacationRecommendation => 'İzin önerisi';

  @override
  String get vacationDaysNeeded => 'Gereken izin günü';

  @override
  String get totalDaysOff => 'Toplam izinli gün';

  @override
  String get relatedHolidays => 'Resmi tatiller';

  @override
  String get veryGood => 'Çok iyi';

  @override
  String get good => 'İyi';

  @override
  String get okay => 'Fena değil';

  @override
  String get low => 'Düşük';

  @override
  String get january => 'Ocak';

  @override
  String get february => 'Şubat';

  @override
  String get march => 'Mart';

  @override
  String get april => 'Nisan';

  @override
  String get may => 'Mayıs';

  @override
  String get june => 'Haziran';

  @override
  String get july => 'Temmuz';

  @override
  String get august => 'Ağustos';

  @override
  String get september => 'Eylül';

  @override
  String get october => 'Ekim';

  @override
  String get november => 'Kasım';

  @override
  String get december => 'Aralık';

  @override
  String bridgeDayLabel(int days, int total) {
    return '$days izin günü → $total gün izinli';
  }

  @override
  String get language => 'Dil';

  @override
  String get settings => 'Ayarlar';

  @override
  String get systemDefault => 'Sistem dili';

  @override
  String get aboutApp => 'Bu uygulama hakkında';

  @override
  String get importantInfoHeader => '⚠️ ÖNEMLİ BİLGİLER';

  @override
  String get disclaimerBody =>
      'Bu uygulama resmi bir devlet uygulaması DEĞİLDİR ve herhangi bir devlet kurumuyla bağlantısı yoktur. Bağımsız, özel bir bilgilendirme hizmetidir. Bağlayıcı bilgiler için lütfen doğrudan yetkili makamlara başvurun.';

  @override
  String get dataSource => 'Veri kaynağı';

  @override
  String get dataSourceBody =>
      'Resmi tatil verileri, Almanya Federal Cumhuriyeti\'nin resmi yasal düzenlemelerine dayanmaktadır. Yetkili kaynaklar şunlardır:';

  @override
  String get sourceBmiLabel => 'BMI – Ulusal resmi tatiller';

  @override
  String get technicalImplementation => 'Teknik uygulama';

  @override
  String get technicalImplementationBody =>
      'Verilerin teknik olarak sağlanması için, yukarıda belirtilen resmi kaynaklardan resmi tatil bilgilerini derleyen OpenHolidays API kullanılır.';

  @override
  String get sourceOpenHolidaysLabel => 'OpenHolidays API';

  @override
  String get privacyPolicy => 'Gizlilik';

  @override
  String get close => 'Kapat';

  @override
  String get yearOverview => 'Yıllık genel bakış';

  @override
  String get notifications => 'Bildirimler';

  @override
  String dDayLabel(int days) {
    return 'D-$days';
  }

  @override
  String get tomorrowIsHoliday => 'Yarın resmi tatil';

  @override
  String daysRemaining(int days) {
    return '$days gün kaldı';
  }

  @override
  String get tomorrowVacationStarts => 'İzin yarın başlıyor';

  @override
  String get onboardingHeadline => '1 gün izin.\n4 gün tatil.';

  @override
  String get onboardingSubtitle =>
      'Eyaletindeki en iyi köprü günlerini bul ve iznini en üst düzeye çıkar.';

  @override
  String get featureAllHolidays => 'Tüm resmi tatiller tek bakışta';

  @override
  String get featureSmartBridgeDays => 'Akıllı köprü günü önerileri';

  @override
  String get featureReminders => 'Köprü günlerinden önce hatırlatmalar';

  @override
  String get letsGo => 'Hadi başlayalım';

  @override
  String get yourState => 'Eyaletin';

  @override
  String get stateSelectionSubtitle =>
      'Resmi tatiller eyalete göre değişir. Kendininkini seç.';

  @override
  String get next => 'İleri';

  @override
  String get almostDone => 'Neredeyse bitti!';

  @override
  String get vacationDaysPerYear => 'Yıllık izin günü';

  @override
  String get howManyVacationDays => 'Kaç izin günün var?';

  @override
  String get bridgeDayReminders => 'Köprü günü hatırlatmaları';

  @override
  String get bridgeDayRemindersSubtitle =>
      'En uygun köprü günlerinden önce bilgilendiril';

  @override
  String get showSchoolHolidays => 'Okul tatillerini göster';

  @override
  String get showSchoolHolidaysSubtitleShort =>
      'Eyaletinin okul tatilleri takvimde';

  @override
  String get done => 'Bitti';

  @override
  String get previousYear => 'Önceki yıl';

  @override
  String get nextYear => 'Sonraki yıl';

  @override
  String get nationwide => 'Ülke geneli';

  @override
  String get regional => 'Bölgesel';

  @override
  String get additionalDaysOff => 'Ekstra izinli';

  @override
  String bridgeDaysWithYear(int year) {
    return 'Köprü günleri $year';
  }

  @override
  String daysCount(int count) {
    return '$count gün';
  }

  @override
  String get calendarExportFailed => 'Takvim dışa aktarımı açılamadı.';

  @override
  String get addToCalendar => 'Takvime ekle';

  @override
  String get notificationHeaderSubtitle =>
      'En uygun izin günleri için zamanında hatırlatılır';

  @override
  String get notificationsNotSupported =>
      'Bu platformda bildirimler desteklenmiyor.';

  @override
  String get bridgeDayNotifications => 'Köprü günü bildirimleri';

  @override
  String get bridgeDayNotificationsSubtitle =>
      'En uygun izin günlerinden önce hatırlatmalar al';

  @override
  String get holidayReminders => 'Resmi tatil hatırlatmaları';

  @override
  String get holidayRemindersSubtitle =>
      'Her resmi tatilden 7 gün ve 1 gün önce hatırlat';

  @override
  String get remindBefore => 'Şu kadar önce hatırlat';

  @override
  String daysBefore(int days) {
    return '$days gün önce';
  }

  @override
  String get monthlySummary => 'Aylık özet';

  @override
  String get monthlySummarySubtitle =>
      'Her ayın 1\'inde resmi tatillerin özetini al';

  @override
  String get calendar => 'Takvim';

  @override
  String get showSchoolHolidaysSubtitle =>
      'Eyaletinin okul tatillerini takvimde göster';

  @override
  String get howItWorks => 'Nasıl çalışır';

  @override
  String get autoDetectionTitle => 'Otomatik algılama';

  @override
  String get autoDetectionBody =>
      'Uygulama, eyaletine göre en iyi köprü günlerini bulur.';

  @override
  String get timelyReminderTitle => 'Zamanında hatırlatma';

  @override
  String get timelyReminderBody =>
      'En uygun dönemden önce zamanında bilgilendirilirsin.';

  @override
  String get moreVacationTitle => 'Daha fazla izin';

  @override
  String get moreVacationBody => 'Az izin günüyle maksimum tatil zamanı kazan!';

  @override
  String get errorLoadingSettings => 'Ayarlar yüklenirken hata oluştu';

  @override
  String get cancel => 'İptal';

  @override
  String get ok => 'Tamam';

  @override
  String get selectState => 'Eyalet seç';

  @override
  String get selectYearAndMonth => 'Yıl ve ay seç';

  @override
  String get bridgeDayTips => 'Köprü günü ipuçları';

  @override
  String get showAll => 'Tümünü göster';

  @override
  String vacationToDaysOff(int vacationDays, int totalDaysOff) {
    return '$vacationDays → $totalDaysOff gün';
  }

  @override
  String get vacationSettings => 'İzin ayarları';

  @override
  String get annualVacationDays => 'Yıllık izin (gün)';

  @override
  String get remainingVacationReminder => 'Kalan izin hatırlatması';

  @override
  String get redeemByMarch31 => '31 Mart\'a kadar kullan';

  @override
  String get save => 'Kaydet';

  @override
  String get vacationEntitlement => 'İzin hakkı';

  @override
  String get edit => 'Düzenle';

  @override
  String daysTakenOfTotal(int used, int total) {
    return '$total günün $used günü kullanıldı';
  }

  @override
  String daysRemainingCount(int count) {
    return '$count gün kaldı';
  }

  @override
  String get bestVacationEfficiency => 'En iyi izin verimliliği';

  @override
  String get noBridgeDaysAvailable => 'Köprü günü yok';

  @override
  String oneVacationDayEquals(int totalDaysOff) {
    return '1 izin günü = $totalDaysOff izinli gün';
  }

  @override
  String get legalHoliday => 'Resmi tatil';

  @override
  String get noHoliday => 'Resmi tatil değil';

  @override
  String durationDaysParen(int count) {
    return '($count gün)';
  }

  @override
  String get addVacation => 'İzin ekle';

  @override
  String get moreHolidays => 'Diğer resmi tatiller';

  @override
  String addedToCalendar(String name) {
    return '$name takvime ekleniyor';
  }

  @override
  String get takeMondayOff => 'Pazartesi izin al';

  @override
  String get takeFridayOff => 'Cuma izin al';

  @override
  String get fourDaysOffPossible => '→ 4 gün izin mümkün!';

  @override
  String get bridgeDayTip => 'Köprü günü ipucu';

  @override
  String calendarWeekNumber(int week) {
    return 'H$week';
  }

  @override
  String get labelOptional => 'Etiket (isteğe bağlı)';

  @override
  String get from => 'Başlangıç';

  @override
  String get to => 'Bitiş';

  @override
  String get vacationDefaultTitle => 'İzin';

  @override
  String get adLabel => 'Reklam';

  @override
  String get monday => 'Pazartesi';

  @override
  String get tuesday => 'Salı';

  @override
  String get wednesday => 'Çarşamba';

  @override
  String get thursday => 'Perşembe';

  @override
  String get friday => 'Cuma';

  @override
  String get saturday => 'Cumartesi';

  @override
  String get sunday => 'Pazar';

  @override
  String notifHolidayInDaysTitle(int days) {
    return 'Sonraki resmi tatile $days gün kaldı!';
  }

  @override
  String get notifPlanNowBody =>
      'Köprü günlerini şimdi planla ve iznini en üst düzeye çıkar.';

  @override
  String notifRemainingBridgeTitle(int count, int year) {
    return '$year yılında $count köprü günü kaldı';
  }

  @override
  String get notifPlanBestBody =>
      'Şimdi planla ve izninden en iyi şekilde yararlan!';

  @override
  String get notifNextHolidayTitle => 'Sonraki resmi tatil';

  @override
  String notifNextHolidayBody(String date, String name) {
    return '$date — $name. Köprü günü ipuçları için uygulamayı aç!';
  }

  @override
  String notifHolidayIn7DaysTitle(String name) {
    return '7 gün sonra: $name';
  }

  @override
  String get notifTimeToPlanBody =>
      'Planlamak için hâlâ zaman var! Köprü günlerine göz at.';

  @override
  String notifHolidayTomorrowTitle(String name) {
    return 'Yarın: $name 🎉';
  }

  @override
  String get notifEnjoyDayOffBody => 'İzin gününün tadını çıkar!';

  @override
  String notifMonthlySummaryTitle(String month, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count resmi tatil',
      one: '$count resmi tatil',
    );
    return '$month: $_temp0';
  }

  @override
  String notifMonthlySummaryBody(String month) {
    return 'Uygulamayı aç ve $month ayının en iyi köprü günlerini bul!';
  }

  @override
  String get notifChannelName => 'Köprü günü hatırlatmaları';

  @override
  String get notifChannelDescription =>
      'Köprü günü izin planlaması için hatırlatmalar';

  @override
  String exportBridgeDaySummary(String holidays) {
    return 'Köprü günleri: $holidays';
  }

  @override
  String get exportBridgeDayTitle => 'İzin (köprü günü)';

  @override
  String get removeAdsTitle => 'Reklamları kaldır';

  @override
  String get removeAdsSubtitle => 'Bir kez öde, sonsuza dek reklamsız.';

  @override
  String buyForPrice(String price) {
    return '$price karşılığında satın al';
  }

  @override
  String get buyNow => 'Şimdi satın al';

  @override
  String get restorePurchases => 'Satın alımları geri yükle';

  @override
  String get premiumActiveTitle => 'Reklamsız mod etkin';

  @override
  String get premiumActiveSubtitle => 'Desteğiniz için teşekkürler!';

  @override
  String get purchaseError =>
      'Satın alma tamamlanamadı. Lütfen daha sonra tekrar deneyin.';

  @override
  String get country => 'Ülke';

  @override
  String get countryGermany => 'Almanya';

  @override
  String get countryAustria => 'Avusturya';

  @override
  String get countrySwitzerland => 'İsviçre';

  @override
  String get allCantons => 'Tüm kantonlar';

  @override
  String get yourCanton => 'Kantonunuz';
}
