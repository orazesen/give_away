import 'package:give_away/src/core/enums.dart';

class FirebaseAuthProvider {
  final String provider;

  AuthProvider get getProvider {
    var p = AuthProvider.phone;

    switch (provider) {
      case 'password':
        p = AuthProvider.password;
        break;
      case 'google.com':
        p = AuthProvider.google;
        break;
      case 'apple.com':
        p = AuthProvider.apple;
        break;
      case 'phone':
        p = AuthProvider.phone;
        break;
      case 'facebook.com':
        p = AuthProvider.facebook;
        break;
      case 'twitter.com':
        p = AuthProvider.twitter;
        break;
      case 'github.com':
        p = AuthProvider.github;
        break;
      case 'yahoo.com':
        p = AuthProvider.yahoo;
        break;
      case 'hotmail.com':
        p = AuthProvider.hotmail;
        break;
      default:
    }

    return p;
  }

  FirebaseAuthProvider({required this.provider});

  @override
  String toString() {
    return "Provider(provider: '${getProvider.name}')";
  }
}
