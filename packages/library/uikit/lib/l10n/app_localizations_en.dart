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
}
