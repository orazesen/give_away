import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ISupabaseAuthDataSource {
  Stream<AuthState> listenAuthChanges();
  Future<String?> signUp({required String email, required String password});
  Future<void> resendEmail({required String email});
  Future<void> signIn({required String email, required String password});
  Future<void> signInWithOAuth({required OAuthProvider oAuthProvider});
}
