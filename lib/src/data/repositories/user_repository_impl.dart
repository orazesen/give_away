import 'dart:developer';

import 'package:give_away/src/domain/data_source/i_supabase_auth_data_source.dart';
import 'package:give_away/src/domain/data_source/i_supabase_postgrest_data_source.dart';
import 'package:give_away/src/domain/enteties/app_user.dart';
import 'package:give_away/src/domain/repositories/i_user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const String _tag = 'UserRepositoryImpl';

@Injectable(as: IUserRepository)
class UserRepositoryImpl implements IUserRepository {
  const UserRepositoryImpl(this._authDataSource, this._postgrestDataSource);

  final ISupabaseAuthDataSource _authDataSource;
  final ISupabasePostgrestDataSource _postgrestDataSource;

  @override
  Stream<AuthState> listenAuthChanges() => _authDataSource.listenAuthChanges();

  @override
  Future<void> googleSignIn() async {
    _authDataSource.signInWithOAuth(oAuthProvider: OAuthProvider.google);
  }

  @override
  Future<void> appleSignIn() async {
    _authDataSource.signInWithOAuth(oAuthProvider: OAuthProvider.apple);
  }

  @override
  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      final id = await _authDataSource.signUp(email: email, password: password);
      return id;
    } catch (e) {
      log(e.toString(), error: e, name: _tag);
      rethrow;
    }
  }

  @override
  Future<void> createUser({required AppUser appUser}) async {
    try {
      final model = appUser.toModel();
      if (model.email != null && model.password != null) {
        await _postgrestDataSource.createAppUser(
          model: model,
        );
      }
    } catch (e) {
      log(e.toString(), error: e, name: _tag);
      rethrow;
    }
  }

  @override
  Future<void> resendEmail({required String email}) async {
    await _authDataSource.resendEmail(email: email);
  }

  @override
  Future<bool> checkEmailConfirmation(
      {required String email, required String password}) async {
    return await _authDataSource.checkEmailConfirmation(
        email: email, password: password);
  }
}
