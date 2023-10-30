import 'package:give_away/src/domain/data_source/i_supabase_auth_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: ISupabaseAuthDataSource)
class SupabaseAuthDataSource implements ISupabaseAuthDataSource {
  const SupabaseAuthDataSource(this._auth);

  final GoTrueClient _auth;

  @override
  Stream<AuthState> listenAuthChanges() {
    return _auth.onAuthStateChange;
  }

  @override
  Future<void> signUp(String email, String password) async {
    await _auth.signUp(email: email, password: password);
  }

  @override
  Future<void> signIn(String email, String password) async {
    _auth.signInWithPassword(email: email, password: password);
  }

  @override
  Future<void> googleSignIn() async {
    await _auth.signInWithOAuth(Provider.google);
  }

  @override
  Future<void> appleSignIn() async {
    await _auth.signInWithApple();
  }
}
