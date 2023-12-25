import 'package:flutter/material.dart';

class PlatformObserver with WidgetsBindingObserver {
  PlatformObserver({required this.onPlatformBrightnessChanged});

  final void Function() onPlatformBrightnessChanged;

  @override
  void didChangePlatformBrightness() => onPlatformBrightnessChanged();
}
