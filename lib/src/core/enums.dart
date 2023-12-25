import 'package:supabase_flutter/supabase_flutter.dart';

enum GiveAwayOnboardingRoutes {
  main,
  signIn,
}

enum AuthProvider {
  none(
    name: 'None',
  ),
  password(
    name: 'Password',
  ),
  google(
    name: 'Google',
    provider: OAuthProvider.google,
  ),
  apple(
    name: 'Apple',
    provider: OAuthProvider.apple,
  );

  final OAuthProvider? provider;
  final String name;

  const AuthProvider({
    required this.name,
    this.provider,
  });
}

enum ThemeType { light, dark, system }
