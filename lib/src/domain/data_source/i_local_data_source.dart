import 'package:give_away/src/core/enums.dart';

abstract class ILocalDataSource {
  bool? getOnboardingSeen();
  Future<void> setOnboardingSeen();
  ThemeType? getThemeType();
  Future<bool> saveThemeType(ThemeType themeType);
}
