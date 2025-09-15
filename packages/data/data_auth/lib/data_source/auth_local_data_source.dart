import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> setHasSeenOnboarding();
  Future<bool> getHasSeenOnboarding();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  AuthLocalDataSourceImpl({required this.sharedPreferences});

  static const String _keyHasSeenOnboarding = 'hasSeenOnboarding';

  @override
  Future<bool> getHasSeenOnboarding() async {
    return sharedPreferences.getBool(_keyHasSeenOnboarding) ?? false;
  }

  @override
  Future<void> setHasSeenOnboarding() async {
    await sharedPreferences.setBool(_keyHasSeenOnboarding, true);
  }
}
