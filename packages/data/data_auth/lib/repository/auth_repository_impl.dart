import 'package:data_auth/data_source/auth_local_data_source.dart';
import 'package:data_auth/data_source/auth_remote_data_source.dart';
import 'package:domain_auth/domain_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalDataSource authLocalDataSource;
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({
    required this.authLocalDataSource,
    required this.authRemoteDataSource,
  });

  @override
  Future<bool> getHasSeenOnboarding() async {
    try {
      return await authLocalDataSource.getHasSeenOnboarding();
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> setHasSeenOnboarding() async {
    try {
      return await authLocalDataSource.setHasSeenOnboarding();
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> getIsMaintenanceModeActive() async {
    try {
      return await authRemoteDataSource.fetchIsMaintenanceModeActive();
    } catch (_) {
      return false;
    }
  }
}