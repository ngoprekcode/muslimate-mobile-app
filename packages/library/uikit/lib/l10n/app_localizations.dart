import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('en'),
    Locale('id'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter Demo'**
  String get appTitle;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter Demo Home Page'**
  String get homeTitle;

  /// No description provided for @counterText.
  ///
  /// In en, this message translates to:
  /// **'You have pushed the button this many times:'**
  String get counterText;

  /// No description provided for @increment.
  ///
  /// In en, this message translates to:
  /// **'Increment'**
  String get increment;

  /// No description provided for @languageMismatchTitle.
  ///
  /// In en, this message translates to:
  /// **'Language Mismatch'**
  String get languageMismatchTitle;

  /// No description provided for @languageMismatchMessage.
  ///
  /// In en, this message translates to:
  /// **'System language is {system}, but you selected {selected}. Do you want to continue?'**
  String languageMismatchMessage({
    required String system,
    required String selected,
  });

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @featureAuthTitleQuran.
  ///
  /// In en, this message translates to:
  /// **'Read the Qur’an'**
  String get featureAuthTitleQuran;

  /// No description provided for @featureAuthTitlePrayer.
  ///
  /// In en, this message translates to:
  /// **'Prayer Times'**
  String get featureAuthTitlePrayer;

  /// No description provided for @featureAuthTitleQibla.
  ///
  /// In en, this message translates to:
  /// **'Qibla Direction'**
  String get featureAuthTitleQibla;

  /// No description provided for @featureAuthTextQuranDesc.
  ///
  /// In en, this message translates to:
  /// **'Access the full Qur’an with translation and tafsir.'**
  String get featureAuthTextQuranDesc;

  /// No description provided for @featureAuthTextPrayerDesc.
  ///
  /// In en, this message translates to:
  /// **'Get reminders and accurate prayer times based on your location.'**
  String get featureAuthTextPrayerDesc;

  /// No description provided for @featureAuthTextQiblaDesc.
  ///
  /// In en, this message translates to:
  /// **'Find the Qibla accurately wherever you are.'**
  String get featureAuthTextQiblaDesc;

  /// No description provided for @featureAuthButtonOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get featureAuthButtonOk;

  /// No description provided for @featureAuthButtonSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get featureAuthButtonSkip;

  /// No description provided for @featureAuthButtonNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get featureAuthButtonNext;

  /// No description provided for @featureAuthButtonGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get featureAuthButtonGetStarted;

  /// No description provided for @featureQiblaAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Qibla Compass'**
  String get featureQiblaAppBarTitle;

  /// No description provided for @featureQiblaPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied. Please enable it in settings.'**
  String get featureQiblaPermissionDenied;

  /// No description provided for @featureQiblaLoadingMessage.
  ///
  /// In en, this message translates to:
  /// **'Getting location & compass...'**
  String get featureQiblaLoadingMessage;

  /// No description provided for @featureQiblaPermissionDeniedShort.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied'**
  String get featureQiblaPermissionDeniedShort;

  /// No description provided for @featureQiblaRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get featureQiblaRetry;

  /// No description provided for @featureQiblaErrorPrefix.
  ///
  /// In en, this message translates to:
  /// **'Error:'**
  String get featureQiblaErrorPrefix;

  /// No description provided for @featureQiblaPreparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing Qibla...'**
  String get featureQiblaPreparing;

  /// No description provided for @featureQiblaLocationUnknown.
  ///
  /// In en, this message translates to:
  /// **'Location unknown'**
  String get featureQiblaLocationUnknown;

  /// No description provided for @featureQiblaAngle.
  ///
  /// In en, this message translates to:
  /// **'Qibla angle'**
  String get featureQiblaAngle;

  /// No description provided for @featureQiblaLowAccuracyHint.
  ///
  /// In en, this message translates to:
  /// **'Tap \"Calibrate\" if accuracy is low'**
  String get featureQiblaLowAccuracyHint;

  /// No description provided for @featureQiblaNoAccuracy.
  ///
  /// In en, this message translates to:
  /// **'No acc'**
  String get featureQiblaNoAccuracy;

  /// No description provided for @featureQiblaCalibrationNeeded.
  ///
  /// In en, this message translates to:
  /// **'Calibration needed'**
  String get featureQiblaCalibrationNeeded;

  /// No description provided for @featureQiblaTips.
  ///
  /// In en, this message translates to:
  /// **'Tips: Place the device on a flat surface, keep away from metal objects, and avoid cases with magnets. For better results, move the phone in a figure-eight motion to calibrate.'**
  String get featureQiblaTips;

  /// No description provided for @featureQiblaDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Calibrate Compass'**
  String get featureQiblaDialogTitle;

  /// No description provided for @featureQiblaDialogInstruction1.
  ///
  /// In en, this message translates to:
  /// **'Move your phone in a figure-eight motion until accuracy improves.'**
  String get featureQiblaDialogInstruction1;

  /// No description provided for @featureQiblaDialogInstruction2.
  ///
  /// In en, this message translates to:
  /// **'Place the device on a flat surface if available.'**
  String get featureQiblaDialogInstruction2;

  /// No description provided for @featureQiblaDialogClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get featureQiblaDialogClose;

  /// No description provided for @featureQiblaDialogDone.
  ///
  /// In en, this message translates to:
  /// **'Done, calibration completed'**
  String get featureQiblaDialogDone;

  /// No description provided for @featureQiblaCalibrationButton.
  ///
  /// In en, this message translates to:
  /// **'Calibrate'**
  String get featureQiblaCalibrationButton;

  /// No description provided for @featureQiblaCompassNorth.
  ///
  /// In en, this message translates to:
  /// **'N'**
  String get featureQiblaCompassNorth;

  /// No description provided for @featureQiblaCompassQiblaLabel.
  ///
  /// In en, this message translates to:
  /// **'Qibla'**
  String get featureQiblaCompassQiblaLabel;

  /// No description provided for @featureQiblaCompassQiblaText.
  ///
  /// In en, this message translates to:
  /// **'Qibla: {angle}°'**
  String featureQiblaCompassQiblaText({required num angle});

  /// No description provided for @featureQiblaCompassHeadingText.
  ///
  /// In en, this message translates to:
  /// **'Heading: {heading}°'**
  String featureQiblaCompassHeadingText({required double heading});

  /// No description provided for @featureMaintenanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Under Maintenance'**
  String get featureMaintenanceTitle;

  /// No description provided for @featureMaintenanceMessage.
  ///
  /// In en, this message translates to:
  /// **'Our service is temporarily down for maintenance. We are working to bring things back as soon as possible. Thank you for your patience.'**
  String get featureMaintenanceMessage;

  /// No description provided for @featureMaintenanceAction.
  ///
  /// In en, this message translates to:
  /// **'Check Status'**
  String get featureMaintenanceAction;

  /// No description provided for @featureMaintenanceUnableToOpen.
  ///
  /// In en, this message translates to:
  /// **'Unable to open status page'**
  String get featureMaintenanceUnableToOpen;

  /// No description provided for @featureMaintenanceAppreciation.
  ///
  /// In en, this message translates to:
  /// **'We appreciate your patience.'**
  String get featureMaintenanceAppreciation;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @languageIndonesian.
  ///
  /// In en, this message translates to:
  /// **'Bahasa Indonesia'**
  String get languageIndonesian;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @settingsChangeLanguageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Change app language'**
  String get settingsChangeLanguageSubtitle;

  /// No description provided for @settingsAppInformation.
  ///
  /// In en, this message translates to:
  /// **'App Information'**
  String get settingsAppInformation;

  /// No description provided for @settingsVersionLabel.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get settingsVersionLabel;

  /// No description provided for @settingsVersionDefault.
  ///
  /// In en, this message translates to:
  /// **'v1.0.0'**
  String get settingsVersionDefault;

  /// No description provided for @settingsFeedbackSupport.
  ///
  /// In en, this message translates to:
  /// **'Feedback & Support'**
  String get settingsFeedbackSupport;

  /// No description provided for @settingsSendFeedbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Send Feedback'**
  String get settingsSendFeedbackTitle;

  /// No description provided for @settingsSendFeedbackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Report bugs or send suggestions'**
  String get settingsSendFeedbackSubtitle;

  /// No description provided for @settingsContactDeveloperTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact Developer'**
  String get settingsContactDeveloperTitle;

  /// No description provided for @settingsContactDeveloperSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Email / Instagram / Website'**
  String get settingsContactDeveloperSubtitle;

  /// No description provided for @settingsFooterThanks.
  ///
  /// In en, this message translates to:
  /// **'Thank you for using our app'**
  String get settingsFooterThanks;
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
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
