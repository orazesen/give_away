import 'package:flutter/material.dart';
import 'package:give_away/src/presentation/theme/constants/app_fonts.dart';
import 'package:give_away/src/presentation/theme/constants/dimensions.dart';
import 'package:give_away/src/presentation/theme/palette/give_away_colors.dart';

const mainFontFamily = 'Inter';
final lightTheme = ThemeData(
  fontFamily: mainFontFamily,
  colorScheme: ColorScheme(
    background: GiveAwayColors.white,
    brightness: Brightness.light,
    error: GiveAwayColors.errorRed,
    onBackground: GiveAwayColors.midnightblue300,
    onError: GiveAwayColors.white,
    onPrimary: GiveAwayColors.white,
    onSecondary: GiveAwayColors.white,
    onSurface: GiveAwayColors.midnightblue300,
    primary: GiveAwayColors.midnightblue300,
    secondary: GiveAwayColors.lightBlack,
    surface: GiveAwayColors.white,
    shadow: GiveAwayColors.black.withOpacity(
      0.4,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const MaterialStatePropertyAll(
        GiveAwayColors.midnightblue300,
      ),
      elevation: const MaterialStatePropertyAll(
        0,
      ),
      foregroundColor: const MaterialStatePropertyAll(
        GiveAwayColors.white,
      ),
      iconColor: const MaterialStatePropertyAll(
        GiveAwayColors.white,
      ),
      overlayColor: const MaterialStatePropertyAll(
        GiveAwayColors.white,
      ),
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: Dimensions.marginBig,
          vertical: Dimensions.marginMiddle,
        ),
      ),
      enableFeedback: true,
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Dimensions.middleCircularRadius,
          ),
        ),
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    disabledBorder: InputBorder.none,
    prefixStyle: TextStyle(
      fontSize: AppFonts.size5XL,
      fontWeight: FontWeight.w400,
      color: GiveAwayColors.grey1,
    ),
    errorBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    suffixStyle: TextStyle(
      fontSize: AppFonts.size5XL,
      fontWeight: FontWeight.w400,
      color: GiveAwayColors.grey1,
    ),
    hintStyle: TextStyle(
      fontSize: AppFonts.size5XL,
      fontWeight: FontWeight.w400,
      color: GiveAwayColors.grey1,
    ),
    errorStyle: TextStyle(
      fontSize: AppFonts.size5XL,
      fontWeight: FontWeight.w400,
      color: GiveAwayColors.errorRed,
    ),
  ),
);
