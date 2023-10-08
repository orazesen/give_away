import 'package:flutter/material.dart';
import 'package:give_away/src/presentation/theme/app_themes.dart';
import 'package:give_away/src/presentation/theme/constants/app_fonts.dart';

extension ThemeExtensions on BuildContext {
  ThemeData get theme {
    return lightTheme;
  }
}

extension TextStylesExtensions on ThemeData {
  TextStyle get base => TextStyle(
        fontFamily: mainFontFamily,
        color: colorScheme.secondary,
      );

  /// 28, w400
  TextStyle get h1 => base.copyWith(
        fontSize: AppFonts.size5XL,
        fontWeight: AppFonts.weightRegular,
      );

  /// 24, w600
  TextStyle get h2 => base.copyWith(
        fontSize: AppFonts.size4XL,
        fontWeight: AppFonts.weightSemiBold,
      );

  /// 22, w700
  TextStyle get profileName => base.copyWith(
        fontSize: AppFonts.size3XL,
        fontWeight: AppFonts.weightBold,
      );

  /// 20, w600
  TextStyle get h3 => base.copyWith(
        fontSize: AppFonts.size2XL,
        fontWeight: AppFonts.weightSemiBold,
      );

  /// 16, w700
  TextStyle get bold16 => base.copyWith(
        fontSize: AppFonts.sizeL,
        fontWeight: AppFonts.weightBold,
      );

  /// 16, w600
  TextStyle get semiBold16 => base.copyWith(
        fontSize: AppFonts.sizeL,
        fontWeight: AppFonts.weightSemiBold,
      );

  /// 16, w500
  TextStyle get medium16 => base.copyWith(
        fontSize: AppFonts.sizeL,
        fontWeight: AppFonts.weightMedium,
      );

  /// 16, w400
  TextStyle get regular16 => base.copyWith(
        fontSize: AppFonts.sizeL,
        fontWeight: AppFonts.weightRegular,
      );

  /// 14, w500
  TextStyle get medium14 => base.copyWith(
        fontSize: AppFonts.sizeM,
        fontWeight: AppFonts.weightMedium,
      );

  /// 14, w400
  TextStyle get regular14 => base.copyWith(
        fontSize: AppFonts.sizeM,
        fontWeight: AppFonts.weightRegular,
      );
}
