import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:give_away/src/presentation/theme/app_themes.dart';
import 'package:give_away/src/presentation/theme/constants/app_fonts.dart';

class GiveAwayTheme extends Equatable {
  const GiveAwayTheme({
    required this.isDark,
    required this.theme,
    required this.iconColor,
    required this.textColor,
    // required this.white,
    // required this.black,
  });

  final ThemeData theme;
  final bool isDark;

  // final Color primaryBackgroundColor;
  // final Color whiteandBlackBackgroundColor;
  // final Color secondaryBackgroundColor;
  // final Color greyBackgroundColor;

  final Color iconColor;
  // final Color iconButtonBackgroundColor;
  // final Color focusedIconColor;
  final Color textColor;
  // final Color greyTextColor;
  // final Color fabColor;
  // final Color clubColor;
  // final Color cardColor;
  // final Color mainDividerThamarBlack100;
  // final Color mainDividerThamarBlack100List;
  // final Color signoutBlack;

  // final Color tariffColor;
  // final Color tariffRadioColor;

  // final Color outlinedButtonSplashColor;
  // final Color elevatedButtonSplashColor;

  // final Color white;
  // final Color black;

  @override
  List<Object?> get props => [
        theme,
        // primaryBackgroundColor,
        // whiteandBlackBackgroundColor,
        // secondaryBackgroundColor,
        iconColor,
        // iconButtonBackgroundColor,
        // focusedIconColor,
        textColor,
        // greyTextColor,
        // fabColor,
        // white,
        // outlinedButtonSplashColor,
        // elevatedButtonSplashColor,
      ];
}

extension TextStylesExtensions on GiveAwayTheme {
  TextStyle get base => TextStyle(
        fontFamily: mainFontFamily,
        color: textColor,
      );

  /// 34, w500
  TextStyle get h1 => base.copyWith(
        fontSize: AppFonts.h1,
        fontWeight: AppFonts.weightRegular,
      );

  /// 30, w500
  TextStyle get h2 => base.copyWith(
        fontSize: AppFonts.h2,
        fontWeight: AppFonts.weightRegular,
      );

  /// 24, w500
  TextStyle get h3 => base.copyWith(
        fontSize: AppFonts.h3,
        fontWeight: AppFonts.weightRegular,
      );

  /// 20, w500,
  TextStyle get h4 => base.copyWith(
        fontSize: AppFonts.h4,
        fontWeight: AppFonts.weightRegular,
      );

  /// 18, w500,
  TextStyle get h5 => base.copyWith(
        fontSize: AppFonts.h5,
        fontWeight: AppFonts.weightRegular,
      );

  /// 18, w500,
  TextStyle get h6 => base.copyWith(
        fontSize: AppFonts.h6,
        fontWeight: AppFonts.weightRegular,
      );

  /// 14, w500
  TextStyle get buttonTitle => base.copyWith(
        fontSize: AppFonts.sizeM,
        fontWeight: AppFonts.weightRegular,
      );

  /// 12, w500
  TextStyle get inputFloatingLabel => base.copyWith(
        fontSize: AppFonts.sizeS,
        fontWeight: AppFonts.weightRegular,
      );
}
