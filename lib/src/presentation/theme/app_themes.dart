import 'package:flutter/material.dart';
import 'package:give_away/src/presentation/theme/constants/app_fonts.dart';
import 'package:give_away/src/presentation/theme/constants/dimensions.dart';
import 'package:give_away/src/presentation/theme/give_away_theme.dart';
import 'package:give_away/src/presentation/theme/palette/give_away_colors.dart';

const mainFontFamily = 'Montserrat';
final lightTheme = GiveAwayTheme(
  isDark: false,
  theme: ThemeData(
    useMaterial3: true,
    fontFamily: mainFontFamily,
    scaffoldBackgroundColor: GiveAwayColors.neutral[950]!,
    colorScheme: ColorScheme(
      primary: GiveAwayColors.primary[500]!,
      onPrimary: GiveAwayColors.primary[990]!,
      secondary: GiveAwayColors.secondary[500]!,
      onSecondary: GiveAwayColors.secondary[990]!,
      error: GiveAwayColors.error[500]!,
      onError: GiveAwayColors.error[990]!,
      surface: GiveAwayColors.neutral[900]!,
      onSurface: GiveAwayColors.primary[300]!,
      background: GiveAwayColors.neutral[950]!,
      onBackground: GiveAwayColors.neutral[100]!,
      shadow: GiveAwayColors.black,
      brightness: Brightness.light,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          GiveAwayColors.primary[500]!,
        ),
        elevation: const MaterialStatePropertyAll(
          0.8,
        ),
        foregroundColor: MaterialStatePropertyAll(
          GiveAwayColors.primary[100]!,
        ),
        iconColor: MaterialStatePropertyAll(
          GiveAwayColors.primary[100]!,
        ),
        overlayColor: MaterialStatePropertyAll(
          GiveAwayColors.primary[100]!,
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
              Dimensions.smallCircularRadius,
            ),
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      disabledBorder: InputBorder.none,
      prefixStyle: TextStyle(
        fontSize: AppFonts.h6,
        fontWeight: FontWeight.w400,
        color: GiveAwayColors.primary[100]!,
      ),
      errorBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      suffixStyle: TextStyle(
        fontSize: AppFonts.h6,
        fontWeight: FontWeight.w400,
        color: GiveAwayColors.primary[100]!,
      ),
      hintStyle: TextStyle(
        fontSize: AppFonts.h6,
        fontWeight: FontWeight.w400,
        color: GiveAwayColors.primary[100]!,
      ),
      errorStyle: TextStyle(
        fontSize: AppFonts.h6,
        fontWeight: FontWeight.w400,
        color: GiveAwayColors.error[500]!,
      ),
    ),
  ),
  // primaryBackgroundColor: primaryBackgroundColor,
  // secondaryBackgroundColor: secondaryBackgroundColor,
  // greyBackgroundColor: greyBackgroundColor,
  // greyTextColor: greyTextColor,
  iconColor: GiveAwayColors.neutral[100]!,
  // focusedIconColor: focusedIconColor,
  textColor: GiveAwayColors.neutral[100]!,
  // fabColor: fabColor,
  // white: white,
  // black: black,
  // outlinedButtonSplashColor: outlinedButtonSplashColor,
  // elevatedButtonSplashColor: elevatedButtonSplashColor,
  // clubColor: clubColor,
  // cardColor: cardColor,
  // tariffColor: tariffColor,
  // tariffRadioColor: tariffRadioColor,
  // mainDividerThamarBlack100: mainDividerThamarBlack100,
  // mainDividerThamarBlack100List: mainDividerThamarBlack100List,
  // signoutBlack: signoutBlack,
);
