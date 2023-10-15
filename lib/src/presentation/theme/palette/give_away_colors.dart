import 'package:flutter/material.dart';

abstract class GiveAwayColors {
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  static MaterialColor primary =
      MaterialColor(const Color(0xFF6750A4).value, const <int, Color>{
    100: Color(0xFF21005D),
    200: Color(0xFF381E72),
    300: Color(0xFF4F378B),
    400: Color(0xFF6750A4),
    500: Color(0xFF7F67BE),
    600: Color(0xFF9A82DB),
    700: Color(0xFFB69DF8),
    800: Color(0xFFD0BCFF),
    900: Color(0xFFEADDFF),
    950: Color(0xFFF6EDFF),
    990: Color(0xFFFFFBFE),
  });

  static MaterialColor secondary =
      MaterialColor(const Color(0xFF625B71).value, const <int, Color>{
    100: Color(0xFF1D192B),
    200: Color(0xFF332D41),
    300: Color(0xFF4A4458),
    400: Color(0xFF625B71),
    500: Color(0xFF7A7289),
    600: Color(0xFF958DA5),
    700: Color(0xFFB0A7C0),
    800: Color(0xFFCCC2DC),
    900: Color(0xFFE8DEF8),
    950: Color(0xFFF6EDFF),
    990: Color(0xFFFFFBFE),
  });

  static MaterialColor tertiary =
      MaterialColor(const Color(0xFF7D5260).value, const <int, Color>{
    100: Color(0xFF31111D),
    200: Color(0xFF492532),
    300: Color(0xFF633B48),
    400: Color(0xFF7D5260),
    500: Color(0xFF986977),
    600: Color(0xFFB58392),
    700: Color(0xFFD29DAC),
    800: Color(0xFFEFB8C8),
    900: Color(0xFFFFD8E4),
    950: Color(0xFFF6EDFF),
    990: Color(0xFFFFFBFA),
  });

  static MaterialColor error =
      MaterialColor(const Color(0xFFB3261E).value, const <int, Color>{
    100: Color(0xFF410E0B),
    200: Color(0xFF601410),
    300: Color(0xFF8C1D18),
    400: Color(0xFFB3261E),
    500: Color(0xFFDC362E),
    600: Color(0xFFE46962),
    700: Color(0xFFEC928E),
    800: Color(0xFFF2B8B5),
    900: Color(0xFFF9DEDC),
    950: Color(0xFFFCEEEE),
    990: Color(0xFFFFFBF9),
  });

  static MaterialColor neutral =
      MaterialColor(const Color(0xFF605D66).value, const <int, Color>{
    100: Color(0xFF1D1A22),
    200: Color(0xFF322F37),
    300: Color(0xFF49454F),
    400: Color(0xFF605D66),
    500: Color(0xFF79747E),
    600: Color(0xFF938F99),
    700: Color(0xFFAEA9B4),
    800: Color(0xFFCAC4D0),
    900: Color(0xFFE7E0EC),
    950: Color(0xFFF5EFF7),
    990: Color(0xFFFFFBFE),
  });

  // static const primary = Color(0xFF6750A4);
  // static const secondary = Color(0xFF625B71);
  // static const tertiary = Color(0xFF7D5260);
  // static const error = Color(0xFFB3261E);

  // static const onPrimary = white;
  // static const onSecondary = white;
  // static const onTertiary = white;
  // static const onError = white;

  // static const primaryContainer = Color(0xFFEADDFF);
  // static const secondaryContainer = Color(0xFFE8DEF8);
  // static const tertiaryContainer = Color(0xFFFFD8E4);
  // static const errorContainer = Color(0xFFF9DEDC);

  // static const onPrimaryContainer = Color(0xFF21005D);
  // static const onSecondaryContainer = Color(0xFF1D192B);
  // static const onTertiaryContainer = Color(0xFF31111D);
  // static const onErrorContainer = Color(0xFF410E0B);

  // static const inverseSurface = Color(0xFF322F35);
  // static const inverseOnSurface = Color(0xFFF5EFF7);
  // static const inversePrimary = Color(0xFFD0BCFF);
  // static const onSurface = Color(0xFF1D1B20);
}
