import 'dart:developer';

import 'package:give_away/src/domain/data_source/i_supabase_auth_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const String _tag = 'SupabaseAuthDataSource';

@Injectable(as: ISupabaseAuthDataSource)
class SupabaseAuthDataSource implements ISupabaseAuthDataSource {
  const SupabaseAuthDataSource(this._auth);

  final GoTrueClient _auth;

  @override
  Stream<AuthState> listenAuthChanges() {
    return _auth.onAuthStateChange;
  }

  @override
  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      final response = await _auth.signUp(email: email, password: password);
      return response.user?.id;
    } catch (e) {
      log('User sign up failed', error: e, name: _tag);
      rethrow;
    }
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    await _auth.signInWithPassword(email: email, password: password);
  }

  @override
  Future<void> signInWithOAuth({required OAuthProvider oAuthProvider}) async {
    await _auth.signInWithOAuth(oAuthProvider);
  }

  @override
  Future<void> resendEmail({required String email}) async {
    await _auth.resend(
      type: OtpType.signup,
      email: email,
    );
  }

  @override
  Future<bool> checkEmailConfirmation(
      {required String email, required String password}) async {
    try {
      await signIn(email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }
}
