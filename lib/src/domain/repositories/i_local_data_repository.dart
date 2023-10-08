abstract class ILocalDataRepository {
  ///Returns `isFirstTime = true` from shared preferences, if it is the first enterance to the application and vice versa
  bool getOnboardingSeen();

  ///Sets `isFirstTime = false` in the shared preferences
  Future<void> setOnboardingSeen();
}
