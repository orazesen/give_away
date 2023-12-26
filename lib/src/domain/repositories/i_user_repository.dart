import 'package:give_away/src/domain/enteties/app_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class IUserRepository {
  Stream<AuthState> listenAuthChanges();

  Future<String?> signUp({required String email, required String password});
  Future<void> createUser({required AppUser appUser});
  Future<void> resendEmail({required String email});
  Future<bool> checkEmailConfirmation(
      {required String email, required String password});
  Future<void> googleSignIn();
  Future<void> appleSignIn();
}
