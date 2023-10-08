import 'package:give_away/src/domain/data_source/i_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:give_away/src/domain/repositories/i_local_data_repository.dart';

@Injectable(as: ILocalDataRepository)
class LocalDataRepositoryImpl implements ILocalDataRepository {
  LocalDataRepositoryImpl(this._localDataSource);
  final ILocalDataSource _localDataSource;

  @override
  bool getOnboardingSeen() {
    return _localDataSource.getOnboardingSeen() ?? false;
  }

  @override
  Future<void> setOnboardingSeen() async =>
      _localDataSource.setOnboardingSeen();
}
