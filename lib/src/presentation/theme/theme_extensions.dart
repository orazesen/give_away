import 'package:flutter/material.dart';
import 'package:give_away/src/presentation/theme/give_away_theme.dart';
import 'package:give_away/src/presentation/theme/theme_provider.dart';

extension ThemeExtensions on BuildContext {
  GiveAwayTheme get theme {
    return ThemeProvider.of(this).theme;
  }
}
