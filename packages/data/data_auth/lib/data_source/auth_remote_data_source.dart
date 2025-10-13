// packages/data/data_auth/lib/data_source/auth_remote_data_source.dart

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';

/// Interface / contract
abstract class AuthRemoteDataSource {
  Future<bool> fetchIsMaintenanceModeActive();
}

/// Implementation registered for DI
@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseRemoteConfig remoteConfig;

  AuthRemoteDataSourceImpl({required this.remoteConfig});

  @override
  Future<bool> fetchIsMaintenanceModeActive() async {
    try {
      final didActivate = await remoteConfig.fetchAndActivate();
      // debug info
      // ignore: avoid_print
      print('RemoteConfig fetchAndActivate returned: $didActivate');
      // Additional diagnostics:
      // ignore: avoid_print
      print('lastFetchStatus: ${remoteConfig.lastFetchStatus}');
      // ignore: avoid_print
      print('lastFetchTime: ${remoteConfig.lastFetchTime}');

      // If fetchAndActivate returned false, try separate fetch+activate as fallback.
      if (!didActivate) {
        try {
          await remoteConfig.fetch();
          final activated = await remoteConfig.activate();
          // ignore: avoid_print
          print('Fallback fetch()+activate() returned: $activated');
        } catch (e) {
          // ignore: avoid_print
          print('Fallback fetch/activate failed: $e');
        }
      }

      return remoteConfig.getBool('is_maintenance_mode_active');
    } catch (e) {
      // Log error as needed, default to false.
      // ignore: avoid_print
      print('RemoteConfig fetch failed: $e');
      return false;
    }
  }
}