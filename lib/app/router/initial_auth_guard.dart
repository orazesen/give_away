import 'package:auto_route/auto_route.dart';

class InitialAuthGuard extends AutoRouteGuard {
  InitialAuthGuard();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {}
}
