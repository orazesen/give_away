import 'package:give_away/src/core/const.dart';
import 'package:give_away/src/core/enums.dart';
import 'package:give_away/src/domain/data_source/i_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: ILocalDataSource)
class LocalDataSourceImpl implements ILocalDataSource {
  const LocalDataSourceImpl(this._preferences);

  final SharedPreferences _preferences;
  @override
  bool? getOnboardingSeen() =>
      _preferences.getBool(GiveAwaySharedPreferencesKeys.hasOnboardingSeen);

  @override
  Future<void> setOnboardingSeen() async {
    _preferences.setBool(GiveAwaySharedPreferencesKeys.hasOnboardingSeen, true);
  }

  @override
  Future<bool> saveThemeType(ThemeType themeType) async {
    return _preferences.setInt(
        GiveAwaySharedPreferencesKeys.themeType, themeType.index);
  }

  @override
  ThemeType? getThemeType() {
    final type = _preferences.getInt(GiveAwaySharedPreferencesKeys.themeType);

    return type != null ? ThemeType.values[type] : null;
  }
}
