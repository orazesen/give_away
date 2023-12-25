import 'package:flutter/material.dart';
import 'package:give_away/src/presentation/theme/constants/app_fonts.dart';
import 'package:give_away/src/presentation/theme/constants/dimensions.dart';
import 'package:give_away/src/presentation/theme/palette/give_away_colors.dart';
import 'package:give_away/src/presentation/theme/theme_extensions.dart';

const String _tag = 'SunpointButton';

class GiveAwayButton extends StatefulWidget {
  const GiveAwayButton({
    super.key,
    this.iconName,
    this.text,
    this.backgroundColor,
    required this.onPressed,
    this.hasFullSize = true,
    this.textColor,
    this.borderColor,
    this.animated = false,
    this.hasSplash = true,
  });
  final IconData? iconName;
  final String? text;
  final Color? backgroundColor;
  final bool hasFullSize;
  final Color? textColor;
  final void Function()? onPressed;
  final Color? borderColor;
  final bool animated;
  final bool hasSplash;

  factory GiveAwayButton.outlined({
    required void Function() onPressed,
    required String text,
    Color? textColor,
    Color? borderColor,
    bool? hasSplash,
  }) =>
      GiveAwayButton(
        text: text,
        textColor: textColor,
        borderColor: borderColor ?? GiveAwayColors.primary[400]!,
        onPressed: onPressed,
        hasSplash: hasSplash ?? true,
      );

  factory GiveAwayButton.both({
    required IconData iconName,
    required String text,
    Color? backgroundColor,
    bool hasFullSize = true,
    required void Function()? onPressed,
    bool? hasSplash,
  }) =>
      GiveAwayButton(
        onPressed: onPressed,
        iconName: iconName,
        text: text,
        backgroundColor: backgroundColor ?? GiveAwayColors.primary[400]!,
        hasFullSize: hasFullSize,
        hasSplash: hasSplash ?? true,
      );

  factory GiveAwayButton.animated({
    required IconData iconName,
    required String text,
    Color? backgroundColor,
    bool hasFullSize = true,
    required void Function()? onPressed,
    bool? hasSplash,
  }) =>
      GiveAwayButton(
        onPressed: onPressed,
        iconName: iconName,
        text: text,
        backgroundColor: backgroundColor ?? GiveAwayColors.primary[400]!,
        hasFullSize: hasFullSize,
        animated: true,
        hasSplash: hasSplash ?? true,
      );

  factory GiveAwayButton.icon({
    required IconData iconName,
    required void Function() onPressed,
    bool? hasSplash,
  }) =>
      GiveAwayButton(
        onPressed: onPressed,
        iconName: iconName,
        backgroundColor: GiveAwayColors.primary[400]!,
        hasFullSize: false,
        hasSplash: hasSplash ?? true,
      );

  factory GiveAwayButton.text({
    required void Function() onPressed,
    required String text,
    Color? backgroundColor,
    bool hasFullSize = true,
    Color? textColor,
    Color? borderColor,
    bool? hasSplash,
  }) =>
      GiveAwayButton(
        onPressed: onPressed,
        text: text,
        backgroundColor: backgroundColor ?? GiveAwayColors.primary[400]!,
        textColor: textColor,
        hasFullSize: hasFullSize,
        borderColor: borderColor,
        hasSplash: hasSplash ?? true,
      );

  @override
  State<GiveAwayButton> createState() => _GiveAwayButtonState();
}

class _GiveAwayButtonState extends State<GiveAwayButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _animation;

  @override
  void didChangeDependencies() {
    if (widget.animated) {
      _controller = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
      )..repeat(reverse: false);
      _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      );
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    if (widget.animated) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.iconName != null && widget.text != null) {
      return TextButton.icon(
        onPressed: widget.onPressed,
        icon: _getIcon(),
        label: _getText(),
        style: _getButtonStyle(),
        statesController: MaterialStatesController(),
      );
    } else {
      return TextButton(
        onPressed: widget.onPressed,
        style: _getButtonStyle(),
        child: widget.iconName == null ? _getText() : _getIcon(),
      );
    }
  }

  Widget _getIcon() {
    return !widget.animated
        ? Icon(
            widget.iconName!,
            color: context.theme.theme.colorScheme.onPrimary,
          )
        : RotationTransition(
            turns: _animation,
            child: Icon(
              widget.iconName!,
              color: context.theme.theme.colorScheme.onPrimary,
            ),
          );
  }

  Widget _getText() {
    return Text(
      widget.text!,
      style: TextStyle(
        fontSize: AppFonts.sizeM,
        color: widget.textColor ?? context.theme.theme.colorScheme.onPrimary,
      ),
    );
  }

  ButtonStyle _getButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(
        widget.backgroundColor,
      ),
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: Dimensions.marginMiddle,
        ),
      ),
      fixedSize: widget.hasFullSize
          ? MaterialStatePropertyAll(
              Size(
                MediaQuery.of(context).size.width,
                Dimensions.margin3x,
              ),
            )
          : null,
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Dimensions.smallCircularRadius,
          ),
          side: BorderSide(
            color: widget.borderColor ?? GiveAwayColors.transparent,
          ),
        ),
      ),
      splashFactory:
          !widget.hasSplash ? NoSplash.splashFactory : InkRipple.splashFactory,
      elevation: const MaterialStatePropertyAll(0),
      overlayColor: !widget.hasSplash
          ? const MaterialStatePropertyAll(
              GiveAwayColors.transparent,
            )
          : null,
    );
  }
}
