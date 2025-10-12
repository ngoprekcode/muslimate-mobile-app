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
  String get featureAuthTitleQuran => 'Baca Al-Qur’an';

  @override
  String get featureAuthTitlePrayer => 'Jadwal Sholat';

  @override
  String get featureAuthTitleQibla => 'Arah Kiblat';

  @override
  String get featureAuthTextQuranDesc =>
      'Dapatkan akses ke Al-Qur’an lengkap dengan terjemahan dan tafsir untuk menemani perjalanan spiritual Anda.';

  @override
  String get featureAuthTextPrayerDesc =>
      'Jangan lewatkan shalat Anda! Dapatkan notifikasi pengingat dan jadwal shalat akurat sesuai lokasi Anda.';

  @override
  String get featureAuthTextQiblaDesc =>
      'Temukan arah kiblat dengan akurat di mana pun Anda berada, sehingga Anda bisa melaksanakan shalat dengan tenang.';

  @override
  String get featureAuthButtonOk => 'OK';

  @override
  String get featureAuthButtonSkip => 'Lewati';

  @override
  String get featureAuthButtonNext => 'Berikutnya';

  @override
  String get featureAuthButtonGetStarted => 'Mulai';

  @override
  String get featureQiblaAppBarTitle => 'Kompas Kiblat';

  @override
  String get featureQiblaPermissionDenied =>
      'Izin lokasi ditolak. Silakan aktifkan di pengaturan.';

  @override
  String get featureQiblaLoadingMessage =>
      'Mengambil lokasi dan arah kompas...';

  @override
  String get featureQiblaPermissionDeniedShort => 'Izin lokasi ditolak';

  @override
  String get featureQiblaRetry => 'Coba Lagi';

  @override
  String get featureQiblaErrorPrefix => 'Kesalahan:';

  @override
  String get featureQiblaPreparing => 'Menyiapkan arah kiblat...';

  @override
  String get featureQiblaLocationUnknown => 'Lokasi tidak diketahui';

  @override
  String get featureQiblaAngle => 'Sudut Kiblat';

  @override
  String get featureQiblaLowAccuracyHint =>
      'Tekan \"Kalibrasi\" jika akurasinya rendah';

  @override
  String get featureQiblaNoAccuracy => 'Tidak ada akurasi';

  @override
  String get featureQiblaCalibrationNeeded => 'Perlu kalibrasi';

  @override
  String get featureQiblaTips =>
      'Tips: Letakkan perangkat di permukaan datar, jauhkan dari logam atau magnet. Untuk hasil lebih baik, gerakkan ponsel membentuk angka delapan.';

  @override
  String get featureQiblaDialogTitle => 'Kalibrasi Kompas';

  @override
  String get featureQiblaDialogInstruction1 =>
      'Gerakkan ponsel membentuk angka delapan sampai akurasi membaik.';

  @override
  String get featureQiblaDialogInstruction2 =>
      'Letakkan perangkat di permukaan datar jika memungkinkan.';

  @override
  String get featureQiblaDialogClose => 'Tutup';

  @override
  String get featureQiblaDialogDone => 'Selesai, sudah dikalibrasi';

  @override
  String get featureQiblaCalibrationButton => 'Kalibrasi';

  @override
  String get featureQiblaCompassNorth => 'U';

  @override
  String get featureQiblaCompassQiblaLabel => 'Kiblat';

  @override
  String featureQiblaCompassQiblaText({required num angle}) {
    return 'Kiblat: $angle°';
  }

  @override
  String featureQiblaCompassHeadingText({required double heading}) {
    return 'Arah: $heading°';
  }
}
