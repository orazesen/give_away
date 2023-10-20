import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ISupabaseAuthDataSource {
  Stream<AuthState> listenAuthChanges();
  Future<Session?> signUp(String email, String password);
  Future<void> googleSignIn();
}
