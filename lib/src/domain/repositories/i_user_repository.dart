import 'package:supabase_flutter/supabase_flutter.dart';

abstract class IUserRepository {
  Stream<AuthState> listenAuthChanges();
}
