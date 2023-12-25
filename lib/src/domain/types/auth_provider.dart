import 'package:give_away/src/core/enums.dart';

class SignInAuthProvider {
  final String authProvider;

  AuthProvider get provider {
    AuthProvider currentProvider = AuthProvider.none;

    switch (authProvider) {
      case 'password':
        currentProvider = AuthProvider.password;
        break;
      case 'google':
        currentProvider = AuthProvider.google;
        break;
      case 'apple':
        currentProvider = AuthProvider.apple;
        break;
      default:
        currentProvider = currentProvider;
        break;
    }
    return currentProvider;
  }

  const SignInAuthProvider({required this.authProvider});

  @override
  String toString() {
    return "Provider(provider: '${provider.name}')";
  }
}
