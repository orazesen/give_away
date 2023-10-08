import 'package:flutter/cupertino.dart';

class Analytics {
  static void logError({required dynamic error, StackTrace? stackTrace}) {
    debugPrint('ANALYTICS ERROR: $error, $stackTrace');
  }
}
