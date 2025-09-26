import 'package:domain_auth/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SetSeenOnboardingUseCase {
  final AuthRepository repository;
  SetSeenOnboardingUseCase({required this.repository});

  Future<bool> call() async {
    return await repository.setHasSeenOnboarding();
  }
}