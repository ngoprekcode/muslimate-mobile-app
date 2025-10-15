abstract class AuthRepository {
  Future<bool> setHasSeenOnboarding();
  Future<bool> getHasSeenOnboarding();
  Future<bool> getIsMaintenanceModeActive();
}