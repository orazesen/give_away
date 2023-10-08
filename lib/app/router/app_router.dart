import 'package:auto_route/auto_route.dart';
import 'package:give_away/app/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: OnboardingRoute.page,
          // guards: [InitialAuthGuard()],
          // initial: true,
          path: '/',
        ),
        AutoRoute(page: LoginRoute.page),
        // AutoRoute(page: AuthenticationRoute.page),
        // AutoRoute(page: AuthenticationCodeRoute.page),
        AutoRoute(
          page: MainRoute.page,
          children: [
            AutoRoute(
              page: HomeRoute.page,
            ),
            AutoRoute(
              page: ProfileRoute.page,
            ),
          ],
        ),
        // AutoRoute(page: ProductDetailRoute.page),
        // AutoRoute(page: AddressMapRoute.page),
        // AutoRoute(page: AppSettingsRoute.page),
      ];
}
