import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:give_away/app/di/injector.dart';
import 'package:give_away/app/localization/localizations.dart';
import 'package:give_away/src/presentation/pages/authentication/login/cubit/login_cubit.dart';
import 'package:give_away/src/presentation/shared/widgets/give_away_app_bar.dart';
import 'package:give_away/src/presentation/shared/widgets/give_away_button.dart';
import 'package:give_away/src/presentation/shared/widgets/give_away_sign_in_with_button.dart';
import 'package:give_away/src/presentation/shared/widgets/give_away_text_form_field.dart';
import 'package:give_away/src/presentation/theme/constants/dimensions.dart';
import 'package:give_away/src/presentation/theme/give_away_theme.dart';
import 'package:give_away/src/presentation/theme/palette/give_away_colors.dart';
import 'package:give_away/src/presentation/theme/theme_extensions.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _loginCubit = i<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GiveAwayAppBar(
        pageName: context.localization.back,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.marginDefault,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(
                  flex: 3,
                  child: SizedBox(),
                ),
                Text(
                  context.localization.login,
                  style: context.theme.h3,
                ),
                const SizedBox(
                  height: Dimensions.marginDefault,
                ),
                GiveAwayTextFormField.email(
                  controller: _emailController,
                  labelText: context.localization.email,
                ),
                const SizedBox(
                  height: Dimensions.marginDefault,
                ),
                GiveAwayTextFormField.password(
                  controller: _passwordController,
                  labelText: context.localization.password,
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: GiveAwayButton.text(
                    textColor: context.theme.theme.colorScheme.onBackground,
                    onPressed: () {},
                    text: context.localization.forgot_password,
                    hasFullSize: false,
                    backgroundColor: GiveAwayColors.transparent,
                    hasSplash: false,
                  ),
                ),
                const SizedBox(
                  height: Dimensions.marginDefault,
                ),
                GiveAwayButton.text(
                  onPressed: () {},
                  text: context.localization.login,
                ),
                const Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                GiveAwaySignInWithButton.google(
                  onPressed: () {
                    _loginCubit.googleSignIn();
                  },
                  isLoading: false,
                ),
                const SizedBox(
                  height: Dimensions.marginDefault,
                ),
                if (defaultTargetPlatform == TargetPlatform.iOS)
                  GiveAwaySignInWithButton.apple(
                    onPressed: () {},
                    isLoading: false,
                  ),
                const SizedBox(
                  height: Dimensions.marginDefault,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
