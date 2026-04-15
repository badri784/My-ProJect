// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Quran`
  String get appTitle {
    return Intl.message('Quran', name: 'appTitle', desc: '', args: []);
  }

  /// `Quran Reading`
  String get appTitle2 {
    return Intl.message('Quran Reading', name: 'appTitle2', desc: '', args: []);
  }

  /// `Bismillah Al-Rahman Al-Rahim`
  String get alBasmalah {
    return Intl.message(
      'Bismillah Al-Rahman Al-Rahim',
      name: 'alBasmalah',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Quran`
  String get quran {
    return Intl.message('Quran', name: 'quran', desc: '', args: []);
  }

  /// `Azkar`
  String get azkar {
    return Intl.message('Azkar', name: 'azkar', desc: '', args: []);
  }

  /// `Sebha`
  String get sebha {
    return Intl.message('Sebha', name: 'sebha', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Previous`
  String get previous {
    return Intl.message('Previous', name: 'previous', desc: '', args: []);
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
  }

  /// `Welcome to Quran and Dua's App`
  String get textOneOnBoardingScreenOne {
    return Intl.message(
      'Welcome to Quran and Dua\'s App',
      name: 'textOneOnBoardingScreenOne',
      desc: '',
      args: [],
    );
  }

  /// `Your daily spiritual companion for reciting the Holy Quran, supplications, and prayers. Carefully designed to be close to your heart.`
  String get textTwoOnBoardingScreenOne {
    return Intl.message(
      'Your daily spiritual companion for reciting the Holy Quran, supplications, and prayers. Carefully designed to be close to your heart.',
      name: 'textTwoOnBoardingScreenOne',
      desc: '',
      args: [],
    );
  }

  /// `Everything you need in one place`
  String get evrrythingYouNeedInOnePlace {
    return Intl.message(
      'Everything you need in one place',
      name: 'evrrythingYouNeedInOnePlace',
      desc: '',
      args: [],
    );
  }

  /// `The Holy Quran in its fullness, supplications of the morning and evening, prayer, and the direction of the qibla. All of this with a clean and easy-to-use design.`
  String get textThreeOnBoardingScreenTwo {
    return Intl.message(
      'The Holy Quran in its fullness, supplications of the morning and evening, prayer, and the direction of the qibla. All of this with a clean and easy-to-use design.',
      name: 'textThreeOnBoardingScreenTwo',
      desc: '',
      args: [],
    );
  }

  /// `Start your journey`
  String get startYourJourney {
    return Intl.message(
      'Start your journey',
      name: 'startYourJourney',
      desc: '',
      args: [],
    );
  }

  /// `With God every day`
  String get withGodEveryDay {
    return Intl.message(
      'With God every day',
      name: 'withGodEveryDay',
      desc: '',
      args: [],
    );
  }

  /// `Make this app a part of your day. Remember God at all times, and draw closer to His Holy Book one step each day.`
  String get textTreeOnBoardingScreenThree {
    return Intl.message(
      'Make this app a part of your day. Remember God at all times, and draw closer to His Holy Book one step each day.',
      name: 'textTreeOnBoardingScreenThree',
      desc: '',
      args: [],
    );
  }

  /// `Surah`
  String get surah {
    return Intl.message('Surah', name: 'surah', desc: '', args: []);
  }

  /// `Ayah`
  String get ayah {
    return Intl.message('Ayah', name: 'ayah', desc: '', args: []);
  }

  /// `Juz`
  String get juz {
    return Intl.message('Juz', name: 'juz', desc: '', args: []);
  }

  /// `Search by surah name...`
  String get searchSurahsName {
    return Intl.message(
      'Search by surah name...',
      name: 'searchSurahsName',
      desc: '',
      args: [],
    );
  }

  /// `About App`
  String get aboutApp {
    return Intl.message('About App', name: 'aboutApp', desc: '', args: []);
  }

  /// `Rate App`
  String get rateApp {
    return Intl.message('Rate App', name: 'rateApp', desc: '', args: []);
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Morning remembrance`
  String get morningRemembrance {
    return Intl.message(
      'Morning remembrance',
      name: 'morningRemembrance',
      desc: '',
      args: [],
    );
  }

  /// `After the prayer remembrance`
  String get afterThePrayerRemembrance {
    return Intl.message(
      'After the prayer remembrance',
      name: 'afterThePrayerRemembrance',
      desc: '',
      args: [],
    );
  }

  /// `Evening remembrance`
  String get eveningRemembrance {
    return Intl.message(
      'Evening remembrance',
      name: 'eveningRemembrance',
      desc: '',
      args: [],
    );
  }

  /// `Sleep Remembrance`
  String get sleepRemembrance {
    return Intl.message(
      'Sleep Remembrance',
      name: 'sleepRemembrance',
      desc: '',
      args: [],
    );
  }

  /// `Start your day with remembrance of God`
  String get startYourDayWithRemembranceOfGod {
    return Intl.message(
      'Start your day with remembrance of God',
      name: 'startYourDayWithRemembranceOfGod',
      desc: '',
      args: [],
    );
  }

  /// `Sleep with the remembrance of God`
  String get sleepWhileRememberingGod {
    return Intl.message(
      'Sleep with the remembrance of God',
      name: 'sleepWhileRememberingGod',
      desc: '',
      args: [],
    );
  }

  /// `Remember God after prayer`
  String get rememberGodAfterPrayer {
    return Intl.message(
      'Remember God after prayer',
      name: 'rememberGodAfterPrayer',
      desc: '',
      args: [],
    );
  }

  /// `End your day with remembrance of God`
  String get endYourDayWithRemembranceOfGod {
    return Intl.message(
      'End your day with remembrance of God',
      name: 'endYourDayWithRemembranceOfGod',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  /// `You can contact us through the platforms mentioned below. Our team will get back to you as soon as possible.`
  String get contactUsText {
    return Intl.message(
      'You can contact us through the platforms mentioned below. Our team will get back to you as soon as possible.',
      name: 'contactUsText',
      desc: '',
      args: [],
    );
  }

  /// `Contact Number`
  String get contactNumber {
    return Intl.message(
      'Contact Number',
      name: 'contactNumber',
      desc: '',
      args: [],
    );
  }

  /// `Contact Email`
  String get contactEmail {
    return Intl.message(
      'Contact Email',
      name: 'contactEmail',
      desc: '',
      args: [],
    );
  }

  /// `Follow Us`
  String get followUs {
    return Intl.message('Follow Us', name: 'followUs', desc: '', args: []);
  }

  /// `Last update: April 2026`
  String get privacyPolicyLastUpdate {
    return Intl.message(
      'Last update: April 2026',
      name: 'privacyPolicyLastUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Introduction`
  String get privacyPolicyIntroductionTitle {
    return Intl.message(
      'Introduction',
      name: 'privacyPolicyIntroductionTitle',
      desc: '',
      args: [],
    );
  }

  /// `At Quran and Azkar app, we respect your privacy and are committed to protecting your personal data. This privacy policy explains how your information is collected, used, and protected when you use our app.`
  String get privacyPolicyIntroductionBody {
    return Intl.message(
      'At Quran and Azkar app, we respect your privacy and are committed to protecting your personal data. This privacy policy explains how your information is collected, used, and protected when you use our app.',
      name: 'privacyPolicyIntroductionBody',
      desc: '',
      args: [],
    );
  }

  /// `Data We Collect`
  String get privacyPolicyDataCollectionTitle {
    return Intl.message(
      'Data We Collect',
      name: 'privacyPolicyDataCollectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `We may collect some technical data such as device type and operating system to improve app performance. We do not collect any sensitive personal data without your prior consent.`
  String get privacyPolicyDataCollectionBody {
    return Intl.message(
      'We may collect some technical data such as device type and operating system to improve app performance. We do not collect any sensitive personal data without your prior consent.',
      name: 'privacyPolicyDataCollectionBody',
      desc: '',
      args: [],
    );
  }

  /// `How We Use Collected Data`
  String get privacyPolicyDataUsageTitle {
    return Intl.message(
      'How We Use Collected Data',
      name: 'privacyPolicyDataUsageTitle',
      desc: '',
      args: [],
    );
  }

  /// `We use collected data to improve app performance and provide better services to you. We only retain data for limited periods and strive to protect it appropriately.`
  String get privacyPolicyDataUsageBody {
    return Intl.message(
      'We use collected data to improve app performance and provide better services to you. We only retain data for limited periods and strive to protect it appropriately.',
      name: 'privacyPolicyDataUsageBody',
      desc: '',
      args: [],
    );
  }

  /// `Personal Data Protection`
  String get privacyPolicyDataProtectionTitle {
    return Intl.message(
      'Personal Data Protection',
      name: 'privacyPolicyDataProtectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `We take appropriate security measures to protect your data from unauthorized access, modification, disclosure, or destruction.`
  String get privacyPolicyDataProtectionBody {
    return Intl.message(
      'We take appropriate security measures to protect your data from unauthorized access, modification, disclosure, or destruction.',
      name: 'privacyPolicyDataProtectionBody',
      desc: '',
      args: [],
    );
  }

  /// `Your Rights`
  String get privacyPolicyRightsTitle {
    return Intl.message(
      'Your Rights',
      name: 'privacyPolicyRightsTitle',
      desc: '',
      args: [],
    );
  }

  /// `You have the right to access, correct, or delete your personal data. You can contact us at any time to exercise these rights.`
  String get privacyPolicyRightsBody {
    return Intl.message(
      'You have the right to access, correct, or delete your personal data. You can contact us at any time to exercise these rights.',
      name: 'privacyPolicyRightsBody',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get privacyPolicyContactTitle {
    return Intl.message(
      'Contact Us',
      name: 'privacyPolicyContactTitle',
      desc: '',
      args: [],
    );
  }

  /// `You can contact us at any time.`
  String get privacyPolicyContactBody {
    return Intl.message(
      'You can contact us at any time.',
      name: 'privacyPolicyContactBody',
      desc: '',
      args: [],
    );
  }

  /// `Qibla Direction`
  String get qiblaTitle {
    return Intl.message(
      'Qibla Direction',
      name: 'qiblaTitle',
      desc: '',
      args: [],
    );
  }

  /// `Rotate your device until the needle points to the Kaaba`
  String get qiblaDescription {
    return Intl.message(
      'Rotate your device until the needle points to the Kaaba',
      name: 'qiblaDescription',
      desc: '',
      args: [],
    );
  }

  /// `Fajr`
  String get fajr {
    return Intl.message('Fajr', name: 'fajr', desc: '', args: []);
  }

  /// `Sunrise`
  String get sunrise {
    return Intl.message('Sunrise', name: 'sunrise', desc: '', args: []);
  }

  /// `Dhuhr`
  String get dhuhr {
    return Intl.message('Dhuhr', name: 'dhuhr', desc: '', args: []);
  }

  /// `Asr`
  String get asr {
    return Intl.message('Asr', name: 'asr', desc: '', args: []);
  }

  /// `Maghrib`
  String get maghrib {
    return Intl.message('Maghrib', name: 'maghrib', desc: '', args: []);
  }

  /// `Isha`
  String get isha {
    return Intl.message('Isha', name: 'isha', desc: '', args: []);
  }

  /// `Prayer Times`
  String get prayerTimes {
    return Intl.message(
      'Prayer Times',
      name: 'prayerTimes',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Location services are disabled. Please enable them to get prayer times.`
  String get locationServicesDisabled {
    return Intl.message(
      'Location services are disabled. Please enable them to get prayer times.',
      name: 'locationServicesDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Location permissions are denied.`
  String get locationPermissionsDenied {
    return Intl.message(
      'Location permissions are denied.',
      name: 'locationPermissionsDenied',
      desc: '',
      args: [],
    );
  }

  /// `Location permissions are permanently denied, we cannot request permissions.`
  String get locationPermissionsPermanentlyDenied {
    return Intl.message(
      'Location permissions are permanently denied, we cannot request permissions.',
      name: 'locationPermissionsPermanentlyDenied',
      desc: '',
      args: [],
    );
  }

  /// `Ayah of the day`
  String get ayahOfTheDay {
    return Intl.message(
      'Ayah of the day',
      name: 'ayahOfTheDay',
      desc: '',
      args: [],
    );
  }

  /// `Recitation and reflection`
  String get recitationAndReflection {
    return Intl.message(
      'Recitation and reflection',
      name: 'recitationAndReflection',
      desc: '',
      args: [],
    );
  }

  /// `Daily Azkar`
  String get dailyAzkar {
    return Intl.message('Daily Azkar', name: 'dailyAzkar', desc: '', args: []);
  }

  /// `Remember God`
  String get rememberGod {
    return Intl.message(
      'Remember God',
      name: 'rememberGod',
      desc: '',
      args: [],
    );
  }

  /// `Qibla direction`
  String get qiblaDirection {
    return Intl.message(
      'Qibla direction',
      name: 'qiblaDirection',
      desc: '',
      args: [],
    );
  }

  /// `Questions and inquiries`
  String get questionsAndInquiries {
    return Intl.message(
      'Questions and inquiries',
      name: 'questionsAndInquiries',
      desc: '',
      args: [],
    );
  }

  /// `Subhan Allah`
  String get subhanAllah {
    return Intl.message(
      'Subhan Allah',
      name: 'subhanAllah',
      desc: '',
      args: [],
    );
  }

  /// `Alhamdulillah`
  String get alhamdulillah {
    return Intl.message(
      'Alhamdulillah',
      name: 'alhamdulillah',
      desc: '',
      args: [],
    );
  }

  /// `Allahu Akbar`
  String get allahuAkbar {
    return Intl.message(
      'Allahu Akbar',
      name: 'allahuAkbar',
      desc: '',
      args: [],
    );
  }

  /// `La hawla wa la quwwata illa billah`
  String get laHawlaWaLaQuwwataIllaBillah {
    return Intl.message(
      'La hawla wa la quwwata illa billah',
      name: 'laHawlaWaLaQuwwataIllaBillah',
      desc: '',
      args: [],
    );
  }

  /// `Subhan Allah wa bihamdih, Subhan Allah Al-Azim`
  String get subhanAllahWaBihamdihSubhanAllahAlAzim {
    return Intl.message(
      'Subhan Allah wa bihamdih, Subhan Allah Al-Azim',
      name: 'subhanAllahWaBihamdihSubhanAllahAlAzim',
      desc: '',
      args: [],
    );
  }

  /// `Astaghfirullah`
  String get astaghfirullah {
    return Intl.message(
      'Astaghfirullah',
      name: 'astaghfirullah',
      desc: '',
      args: [],
    );
  }

  /// `O Allah, bless our Master Muhammad`
  String get allahummaSalliAlaMuhammad {
    return Intl.message(
      'O Allah, bless our Master Muhammad',
      name: 'allahummaSalliAlaMuhammad',
      desc: '',
      args: [],
    );
  }

  /// `Total Count`
  String get totalCount {
    return Intl.message('Total Count', name: 'totalCount', desc: '', args: []);
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: '', args: []);
  }

  /// `Verily, in the remembrance of Allah do hearts find rest`
  String get alaBithikrillahiTatmaInQulub {
    return Intl.message(
      'Verily, in the remembrance of Allah do hearts find rest',
      name: 'alaBithikrillahiTatmaInQulub',
      desc: '',
      args: [],
    );
  }

  /// `Surah Ar-Ra'd - Ayah 28`
  String get surahArRadAyah28 {
    return Intl.message(
      'Surah Ar-Ra\'d - Ayah 28',
      name: 'surahArRadAyah28',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred, please try again`
  String get anErrorOccurredTryAgain {
    return Intl.message(
      'An error occurred, please try again',
      name: 'anErrorOccurredTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `App Features`
  String get appFeatures {
    return Intl.message(
      'App Features',
      name: 'appFeatures',
      desc: '',
      args: [],
    );
  }

  /// `Ahkam`
  String get ahkam {
    return Intl.message('Ahkam', name: 'ahkam', desc: '', args: []);
  }

  /// `Repetition is over`
  String get repetIsOver {
    return Intl.message(
      'Repetition is over',
      name: 'repetIsOver',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
