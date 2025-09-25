// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Demo Flutter';

  @override
  String get homeTitle => 'Halaman Utama Demo Flutter';

  @override
  String get counterText => 'Tombol ini sudah ditekan sebanyak:';

  @override
  String get increment => 'Tambah';

  @override
  String get languageMismatchTitle => 'Bahasa Berbeda';

  @override
  String languageMismatchMessage({
    required String system,
    required String selected,
  }) {
    return 'Bahasa sistem adalah $system, tetapi kamu memilih $selected. Lanjutkan?';
  }

  @override
  String get cancel => 'Batal';

  @override
  String get ok => 'OK';

  @override
  String get onboardingQuranTitle => 'Baca Al-Qur’an';

  @override
  String get onboardingQuranDesc =>
      'Dapatkan akses ke Al-Qur’an lengkap dengan terjemahan dan tafsir untuk menemani perjalanan spiritual Anda.';

  @override
  String get onboardingPrayerTitle => 'Jadwal Sholat';

  @override
  String get onboardingPrayerDesc =>
      'Jangan lewatkan shalat Anda! Dapatkan notifikasi pengingat dan jadwal shalat akurat sesuai lokasi Anda.';

  @override
  String get onboardingQiblaTitle => 'Arah Kiblat';

  @override
  String get onboardingQiblaDesc =>
      'Temukan arah kiblat dengan akurat di mana pun Anda berada, sehingga Anda bisa melaksanakan shalat dengan tenang.';

  @override
  String get skip => 'Lewati';

  @override
  String get next => 'Berikutnya';

  @override
  String get getStarted => 'Mulai';
}
