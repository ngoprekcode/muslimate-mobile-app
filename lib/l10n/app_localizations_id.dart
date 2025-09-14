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
}
