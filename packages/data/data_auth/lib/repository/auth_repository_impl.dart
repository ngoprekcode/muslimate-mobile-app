import 'package:data_auth/data_source/auth_local_data_source.dart';
import 'package:domain_auth/domain_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalDataSource authLocalDataSource;
  AuthRepositoryImpl({required this.authLocalDataSource});

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
}
