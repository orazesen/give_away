import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:give_away/src/presentation/shared/widgets/give_away_vector_image.dart';
import 'package:give_away/src/presentation/theme/constants/app_fonts.dart';
import 'package:give_away/src/presentation/theme/constants/dimensions.dart';
import 'package:give_away/src/presentation/theme/constants/give_away_icons.dart';
import 'package:give_away/src/presentation/theme/give_away_theme.dart';
import 'package:give_away/src/presentation/theme/palette/give_away_colors.dart';
import 'package:give_away/src/presentation/theme/theme_extensions.dart';

class GiveAwaySignInWithButton extends StatefulWidget {
  const GiveAwaySignInWithButton({
    required this.onPressed,
    required this.isLoading,
    this.backgroundColor,
    this.textStyle,
    required this.text,
    required this.icon,
    this.iconPadding,
    this.iconColor,
    super.key,
  });
  final void Function() onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final String text;
  final String icon;
  final double? iconPadding;
  final Color? iconColor;

  factory GiveAwaySignInWithButton.google({
    required void Function() onPressed,
    required bool isLoading,
  }) =>
      GiveAwaySignInWithButton(
        onPressed: onPressed,
        isLoading: isLoading,
        text: 'Continue with Google',
        icon: GiveAwayIcons.googleIcon,
        backgroundColor: GiveAwayColors.white,
        textStyle: TextStyle(
          fontSize: AppFonts.h6,
          fontWeight: FontWeight.w600,
          color: GiveAwayColors.neutral[500]!,
        ),
      );
  factory GiveAwaySignInWithButton.apple({
    required void Function() onPressed,
    required bool isLoading,
  }) =>
      GiveAwaySignInWithButton(
        onPressed: onPressed,
        isLoading: isLoading,
        text: 'Continue with Apple',
        icon: GiveAwayIcons.appleIcon,
        backgroundColor: GiveAwayColors.black,
        iconColor: GiveAwayColors.white,
        textStyle: const TextStyle(
          fontSize: AppFonts.h6,
          fontWeight: FontWeight.w500,
          color: GiveAwayColors.white,
        ),
        iconPadding: 4,
      );

  @override
  State<GiveAwaySignInWithButton> createState() =>
      _GiveAwaySignInWithButtonState();
}

class _GiveAwaySignInWithButtonState extends State<GiveAwaySignInWithButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: !widget.isLoading
          ? _getTextButton()
          : Center(
              child: CircularProgressIndicator(
                color: GiveAwayColors.primary[500]!,
              ),
            ),
    );
  }

  TextButton _getTextButton() {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          widget.backgroundColor ?? GiveAwayColors.transparent,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.smallCircularRadius,
            ),
          ),
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.all(
            6,
          ),
        ),
      ),
      onPressed: () => !widget.isLoading ? widget.onPressed() : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 36,
            width: 36,
            child: Padding(
              padding: EdgeInsets.all(widget.iconPadding ?? 6.0),
              child: GiveAwayVectorImage(
                assetName: widget.icon,
                fit: BoxFit.contain,
                color: widget.iconColor,
              ),
            ),
          ),
          const SizedBox(
            width: Dimensions.marginSmall,
          ),
          AutoSizeText(
            widget.text,
            maxLines: 1,
            style: widget.textStyle ??
                context.theme.buttonTitleBold.copyWith(
                  color: GiveAwayColors.white,
                ),
          ),
        ],
      ),
    );
  }
}
