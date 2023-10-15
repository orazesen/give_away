import 'package:give_away/src/domain/data_source/i_supabase_auth_data_source.dart';
import 'package:give_away/src/domain/repositories/i_user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: IUserRepository)
class UserRepositoryImpl implements IUserRepository {
  const UserRepositoryImpl(this._authDataSource);

  final ISupabaseAuthDataSource _authDataSource;

  @override
  Stream<AuthState> listenAuthChanges() => _authDataSource.listenAuthChanges();
}
