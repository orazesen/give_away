import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:give_away/src/presentation/theme/constants/dimensions.dart';
import 'package:give_away/src/presentation/theme/give_away_theme.dart';
import 'package:give_away/src/presentation/theme/palette/give_away_colors.dart';
import 'package:give_away/src/presentation/theme/theme_extensions.dart';

class GiveAwayAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GiveAwayAppBar({
    super.key,
    required this.pageName,
    this.bottom,
    this.backgroundColor,
    this.elevation,
    this.centerTitle,
    this.textColor,
    this.leading,
  });
  final String pageName;
  final PreferredSize? bottom;
  final Color? backgroundColor;
  final Color? textColor;
  final double? elevation;
  final bool? centerTitle;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final textColor = this.textColor ?? context.theme.textColor;

    return AppBar(
      backgroundColor:
          backgroundColor ?? context.theme.theme.colorScheme.background,
      elevation: elevation ?? 1,
      bottom: bottom,
      centerTitle: centerTitle ?? false,
      leadingWidth: Dimensions.margin3x,
      leading: leading ??
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.marginDefault,
            ),
            child: IconButton(
              onPressed: () {
                context.popRoute();
              },
              style: const ButtonStyle(
                splashFactory: NoSplash.splashFactory,
              ),
              splashColor: GiveAwayColors.transparent,
              highlightColor: GiveAwayColors.transparent,
              hoverColor: GiveAwayColors.transparent,
              icon: Icon(
                Icons.arrow_back_ios,
                size: Dimensions.smallSize,
                color: textColor,
              ),
            ),
          ),
      title: Text(
        pageName,
        style: context.theme.h6.copyWith(
          color: textColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
