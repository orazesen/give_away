import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ISupabaseAuthDataSource {
  Stream<AuthState> listenAuthChanges();
  Future<void> signUp(String email, String password);
  Future<void> signIn(String email, String password);
  Future<void> googleSignIn();
  Future<void> appleSignIn();
}
