import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:give_away/app/di/injector.dart';

const _tag = 'AppBlocObserver';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)', name: _tag);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)', name: _tag);
    super.onError(bloc, error, stackTrace);
  }
}

const String _bootstrapTag = 'bootstrap';

Future<void> bootstrap(
  FutureOr<Widget> Function(int androidSdkVersion) builder,
) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();

  await runZonedGuarded(
    () async {
      WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      await dotenv.load(fileName: ".env");
      final supabaseUrl = dotenv.env['SUPABASE_URL'];
      final anonKey = dotenv.env['SUPABASE_ANON_KEY'];
      if (supabaseUrl == null || anonKey == null) {
        log(
          'Supabase keys not found',
          error: 'Supabase keys are missing',
          name: _bootstrapTag,
        );
      } else {
        await Supabase.initialize(
          url: supabaseUrl,
          anonKey: anonKey,
        );
      }
      // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      configureDependencies();
      final locale = Locale(Platform.localeName);
      Intl.systemLocale = locale.toString();

      if (kDebugMode) {
        // await FirebaseCrashlytics.instance
        //     .setCrashlyticsCollectionEnabled(false);
      } else {
        // await FirebaseCrashlytics.instance
        //     .setCrashlyticsCollectionEnabled(true);
      }
      // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

      final deviceInfo = await DeviceInfoPlugin().deviceInfo;
      final androidSdkVersion =
          deviceInfo is AndroidDeviceInfo ? deviceInfo.version.sdkInt : 0;

      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      runApp(await builder(androidSdkVersion));
    },
    (error, stackTrace) => log(error.toString(),
        error: error, stackTrace: stackTrace, name: _bootstrapTag),
    // FirebaseCrashlytics.instance.recordError(error, stackTrace),
  );
}
