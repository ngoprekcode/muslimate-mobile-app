import 'package:domain_auth/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetSeenOnboardingUseCase {
  final AuthRepository repository;
  GetSeenOnboardingUseCase({required this.repository});

  Future<bool> call() {
    return repository.getHasSeenOnboarding();
  }
}
