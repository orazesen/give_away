import 'package:give_away/src/core/enums.dart';
import 'package:give_away/src/domain/data_source/i_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:give_away/src/domain/repositories/i_local_data_repository.dart';
import 'package:rxdart/rxdart.dart';

@Injectable(as: ILocalDataRepository)
class LocalDataRepositoryImpl implements ILocalDataRepository {
  LocalDataRepositoryImpl(this._localDataSource);
  final ILocalDataSource _localDataSource;
  final BehaviorSubject<ThemeType> _themeSubject = BehaviorSubject();

  @override
  bool getOnboardingSeen() {
    return _localDataSource.getOnboardingSeen() ?? false;
  }

  @override
  Future<void> setOnboardingSeen() async =>
      _localDataSource.setOnboardingSeen();

  @override
  Stream<ThemeType> get theme {
    if (!_themeSubject.hasValue) {
      setInitialTheme();
    }
    return _themeSubject;
  }

  @override
  Future<void> setInitialTheme() async {
    final theme = _localDataSource.getThemeType() ?? ThemeType.system;
    _themeSubject.add(theme);
  }

  @override
  Future<void> saveThemeType(ThemeType themeType) async {
    _themeSubject.add(themeType);
    await _localDataSource.saveThemeType(themeType);
  }
}
