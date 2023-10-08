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
  Future<Session?> signUp(String email, String password) async {
    final response = await _auth.signUp(email: email, password: password);
    return response.session;
  }
}
