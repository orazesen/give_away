import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:give_away/app/observers/platform_observer.dart';
import 'package:give_away/src/core/enums.dart';
import 'package:give_away/src/presentation/common_cubits/theme/theme_cubit.dart';
import 'package:give_away/src/presentation/common_cubits/user/user_cubit.dart';
import 'package:give_away/src/presentation/theme/give_away_theme.dart';
import 'package:give_away/src/presentation/theme/theme_extensions.dart';
import 'package:give_away/src/presentation/theme/theme_provider.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:give_away/app/di/injector.dart';
import 'package:give_away/app/router/app_router.dart';
import 'package:give_away/app/observers/give_away_route_observer.dart';
import 'package:give_away/src/presentation/behaviors/give_away_scroll_behavior.dart';
import 'package:give_away/src/presentation/pages/onboarding/cubit/onboarding_cubit.dart';
import 'package:give_away/src/presentation/theme/app_themes.dart';

class App extends StatefulWidget {
  App({
    super.key,
    required this.androidSdkVersion,
  });

  final int androidSdkVersion;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _router = AppRouter();

  late PlatformObserver _platformObserver;
  final _themeCubit = i<ThemeCubit>();

  @override
  void initState() {
    _platformObserver = PlatformObserver(onPlatformBrightnessChanged: () {
      if (_isPlatformBrightnessLight) {
        _setLightSystemUiOverlay();
      } else {
        // _setDarkSystemUiOverlay();
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _themeCubit,
        ),
        BlocProvider(
          create: (context) => i<UserCubit>(),
        ),
        BlocProvider(
          create: (context) => i<OnboardingCubit>(),
        ),
      ],
      child: BlocConsumer<ThemeCubit, ThemeState>(
        bloc: _themeCubit,
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            succeeded: (currentTheme) {
              if (currentTheme == ThemeType.system) {
                WidgetsBinding.instance.addObserver(_platformObserver);
              } else {
                WidgetsBinding.instance.removeObserver(_platformObserver);
                if (currentTheme == ThemeType.dark) {
                  // _setDarkSystemUiOverlay();
                } else {
                  _setLightSystemUiOverlay();
                }
              }
            },
          );
        },
        builder: (context, state) {
          late GiveAwayTheme theme;
          state.maybeWhen(
            orElse: () {
              theme = _selectTheme(ThemeType.system);
            },
            succeeded: (currentTheme) {
              theme = _selectTheme(currentTheme);
            },
          );
          return ThemeProvider(
            theme: theme,
            child: Builder(builder: (context) {
              return OverlaySupport.global(
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
                  theme: context.theme.theme,
                ),
              );
            }),
          );
        },
      ),
    );
  }

  //   void _setDarkSystemUiOverlay() {
  //   SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle.dark.copyWith(
  //       systemNavigationBarIconBrightness: Brightness.light,
  //       systemNavigationBarColor: lig.primaryBackgroundColor,
  //       statusBarColor: darkTheme.primaryBackgroundColor,
  //       statusBarIconBrightness: Brightness.light,
  //     ),
  //   );
  // }

  void _setLightSystemUiOverlay() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: lightTheme.theme.primaryColor,
        statusBarColor: lightTheme.theme.colorScheme.background,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  bool get _isPlatformBrightnessLight =>
      MediaQueryData.fromView(
        WidgetsBinding.instance.platformDispatcher.views.single,
      ).platformBrightness ==
      Brightness.light;

  GiveAwayTheme _selectTheme(ThemeType themeType) {
    return lightTheme;
    //  themeType == ThemeType.system
    //     ? _isPlatformBrightnessLight
    //         ? lightTheme
    //         : lightTheme //darkTheme
    //     : themeType == ThemeType.dark
    //         ? lightTheme //darkTheme
    //         : lightTheme;
  }
}
