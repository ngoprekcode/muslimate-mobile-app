// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Flutter Demo';

  @override
  String get homeTitle => 'Flutter Demo Home Page';

  @override
  String get counterText => 'You have pushed the button this many times:';

  @override
  String get increment => 'Increment';

  @override
  String get languageMismatchTitle => 'Language Mismatch';

  @override
  String languageMismatchMessage({
    required String system,
    required String selected,
  }) {
    return 'System language is $system, but you selected $selected. Do you want to continue?';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'OK';

  @override
  String get featureAuthTitleQuran => 'Read the Qur’an';

  @override
  String get featureAuthTitlePrayer => 'Prayer Times';

  @override
  String get featureAuthTitleQibla => 'Qibla Direction';

  @override
  String get featureAuthTextQuranDesc =>
      'Access the full Qur’an with translation and tafsir.';

  @override
  String get featureAuthTextPrayerDesc =>
      'Get reminders and accurate prayer times based on your location.';

  @override
  String get featureAuthTextQiblaDesc =>
      'Find the Qibla accurately wherever you are.';

  @override
  String get featureAuthButtonOk => 'OK';

  @override
  String get featureAuthButtonSkip => 'Skip';

  @override
  String get featureAuthButtonNext => 'Next';

  @override
  String get featureAuthButtonGetStarted => 'Get Started';

  @override
  String get featureQiblaAppBarTitle => 'Qibla Compass';

  @override
  String get featureQiblaPermissionDenied =>
      'Location permission denied. Please enable it in settings.';

  @override
  String get featureQiblaLoadingMessage => 'Getting location & compass...';

  @override
  String get featureQiblaPermissionDeniedShort => 'Location permission denied';

  @override
  String get featureQiblaRetry => 'Retry';

  @override
  String get featureQiblaErrorPrefix => 'Error:';

  @override
  String get featureQiblaPreparing => 'Preparing Qibla...';

  @override
  String get featureQiblaLocationUnknown => 'Location unknown';

  @override
  String get featureQiblaAngle => 'Qibla angle';

  @override
  String get featureQiblaLowAccuracyHint =>
      'Tap \"Calibrate\" if accuracy is low';

  @override
  String get featureQiblaNoAccuracy => 'No acc';

  @override
  String get featureQiblaCalibrationNeeded => 'Calibration needed';

  @override
  String get featureQiblaTips =>
      'Tips: Place the device on a flat surface, keep away from metal objects, and avoid cases with magnets. For better results, move the phone in a figure-eight motion to calibrate.';

  @override
  String get featureQiblaDialogTitle => 'Calibrate Compass';

  @override
  String get featureQiblaDialogInstruction1 =>
      'Move your phone in a figure-eight motion until accuracy improves.';

  @override
  String get featureQiblaDialogInstruction2 =>
      'Place the device on a flat surface if available.';

  @override
  String get featureQiblaDialogClose => 'Close';

  @override
  String get featureQiblaDialogDone => 'Done, calibration completed';

  @override
  String get featureQiblaCalibrationButton => 'Calibrate';

  @override
  String get featureQiblaCompassNorth => 'N';

  @override
  String get featureQiblaCompassQiblaLabel => 'Qibla';

  @override
  String featureQiblaCompassQiblaText({required num angle}) {
    return 'Qibla: $angle°';
  }

  @override
  String featureQiblaCompassHeadingText({required double heading}) {
    return 'Heading: $heading°';
  }

  @override
  String get featureMaintenanceTitle => 'Under Maintenance';

  @override
  String get featureMaintenanceMessage =>
      'Our service is temporarily down for maintenance. We are working to bring things back as soon as possible. Thank you for your patience.';

  @override
  String get featureMaintenanceAction => 'Check Status';

  @override
  String get featureMaintenanceUnableToOpen => 'Unable to open status page';

  @override
  String get featureMaintenanceAppreciation => 'We appreciate your patience.';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get languageIndonesian => 'Bahasa Indonesia';

  @override
  String get languageEnglish => 'English';

  @override
  String get settingsChangeLanguageSubtitle => 'Change app language';

  @override
  String get settingsAppInformation => 'App Information';

  @override
  String get settingsVersionLabel => 'Version';

  @override
  String get settingsVersionDefault => 'v1.0.0';

  @override
  String get settingsFeedbackSupport => 'Feedback & Support';

  @override
  String get settingsSendFeedbackTitle => 'Send Feedback';

  @override
  String get settingsSendFeedbackSubtitle => 'Report bugs or send suggestions';

  @override
  String get settingsContactDeveloperTitle => 'Contact Developer';

  @override
  String get settingsContactDeveloperSubtitle => 'Email / Instagram / Website';

  @override
  String get settingsFooterThanks => 'Thank you for using our app';

  @override
  String get updateHardTitle => 'Update Required';

  @override
  String get updateHardMessage =>
      'Your app version is no longer supported. Please update to continue using the app.';

  @override
  String get updateSoftTitle => 'New Update Available';

  @override
  String get updateSoftMessage =>
      'A newer version of the app is available. Would you like to update now?';

  @override
  String get updateNow => 'Update Now';

  @override
  String get later => 'Later';
}
