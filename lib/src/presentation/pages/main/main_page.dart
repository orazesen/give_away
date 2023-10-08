import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:give_away/app/router/app_router.gr.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

part './widgets/bottom_nav_bar_part.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  List<PageRouteInfo> get _routes => [
        const HomeRoute(),
        const ProfileRoute(),
        const ProfileRoute(),
      ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      resizeToAvoidBottomInset: true,
      extendBody: false,
      routes: _routes,
      homeIndex: 0,
      bottomNavigationBuilder: (_, router) {
        return _BottomNavBarPart(
          router,
        );
      },
    );
  }
}
