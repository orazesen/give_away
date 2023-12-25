import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:give_away/app/localization/localizations.dart';
import 'package:give_away/app/router/app_router.gr.dart';
import 'package:give_away/src/presentation/shared/widgets/give_away_button.dart';
import 'package:give_away/src/presentation/theme/constants/dimensions.dart';
import 'package:give_away/src/presentation/theme/give_away_theme.dart';
import 'package:give_away/src/presentation/theme/palette/give_away_colors.dart';
import 'package:give_away/src/presentation/theme/theme_extensions.dart';

@RoutePage()
class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.marginDefault,
          ),
          child: Column(
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              Text(
                context.localization.want_to_join,
                style: context.theme.h2Bold,
              ),
              const SizedBox(
                height: Dimensions.marginDefault,
              ),
              GiveAwayButton.text(
                onPressed: () {
                  context.router.push(RegistrationRoute());
                },
                text: context.localization.yes_join,
              ),
              const SizedBox(
                height: Dimensions.marginDefault,
              ),
              GiveAwayButton.text(
                onPressed: () {
                  context.router.push(LoginRoute());
                },
                text: context.localization.already_joined,
                backgroundColor: GiveAwayColors.primary[700],
              ),
              const SizedBox(
                height: Dimensions.marginDefault,
              ),
              Text(
                context.localization.privacy_policy,
                textAlign: TextAlign.center,
                style: context.theme.informationText,
              ),
              const SizedBox(
                height: Dimensions.marginDefault,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
