abstract class AuthRepository {
  Future<void> setHasSeenOnboarding();
  Future<bool> getHasSeenOnboarding();
}
