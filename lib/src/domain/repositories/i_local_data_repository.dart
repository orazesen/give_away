import 'package:give_away/src/core/enums.dart';

abstract class ILocalDataRepository {
  ///Returns `isFirstTime = true` from shared preferences, if it is the first enterance to the application and vice versa
  bool getOnboardingSeen();

  ///Sets `isFirstTime = false` in the shared preferences
  Future<void> setOnboardingSeen();

  ///Listen for theme changes
  Stream<ThemeType> get theme;

  ///
  void setInitialTheme();

  Future<void> saveThemeType(ThemeType themeType);
}
