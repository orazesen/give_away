import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:give_away/app/di/injector.dart';
import 'package:give_away/app/router/app_router.dart';
import 'package:give_away/app/router/give_away_route_observer.dart';
import 'package:give_away/src/presentation/behaviors/give_away_scroll_behavior.dart';
import 'package:give_away/src/presentation/pages/onboarding/cubit/onboarding_cubit.dart';
import 'package:give_away/src/presentation/theme/app_themes.dart';

class App extends StatelessWidget with WidgetsBindingObserver {
  App({
    super.key,
    required this.androidSdkVersion,
  });

  final int androidSdkVersion;

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => i<OnboardingCubit>()),
      ],
      child: OverlaySupport.global(
        child: MaterialApp.router(
          showPerformanceOverlay: false,
          debugShowCheckedModeBanner: true,
          scrollBehavior: GiveAwayScrollBehavior(),
          key: UniqueKey(),
          routerDelegate: AutoRouterDelegate(
            _router,
            navigatorObservers: () => [
              GiveAwayRouteObserver(),
            ],
          ),
          routeInformationParser: _router.defaultRouteParser(),
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('de', 'DE'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: lightTheme,
        ),
      ),
    );
  }
}
