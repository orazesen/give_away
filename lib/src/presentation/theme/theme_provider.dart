import 'package:flutter/material.dart';
import 'package:give_away/src/presentation/theme/give_away_theme.dart';

class ThemeProvider extends InheritedWidget {
  const ThemeProvider({
    required super.child,
    required this.theme,
    super.key,
  });
  final GiveAwayTheme theme;

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) => theme != oldWidget.theme;

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }
}
