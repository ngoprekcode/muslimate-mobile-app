import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<bool> setHasSeenOnboarding();
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
  Future<bool> setHasSeenOnboarding() async {
    return await sharedPreferences.setBool(_keyHasSeenOnboarding, true);
  }
}
