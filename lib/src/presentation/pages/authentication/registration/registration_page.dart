import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:give_away/app/di/injector.dart';
import 'package:give_away/app/localization/localizations.dart';
import 'package:give_away/src/presentation/pages/authentication/registration/cubit/registration_cubit.dart';
import 'package:give_away/src/presentation/shared/widgets/give_away_app_bar.dart';
import 'package:give_away/src/presentation/shared/widgets/give_away_button.dart';
import 'package:give_away/src/presentation/shared/widgets/give_away_sign_in_with_button.dart';
import 'package:give_away/src/presentation/shared/widgets/give_away_text_form_field.dart';
import 'package:give_away/src/presentation/theme/constants/dimensions.dart';

@RoutePage()
class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});
  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _birthDate = TextEditingController();

  final _registrationCubit = i<RegistrationCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GiveAwayAppBar(
        pageName: context.localization!.back,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding:
            const EdgeInsets.symmetric(horizontal: Dimensions.marginDefault),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: Dimensions.margin4x,
              ),
              const CircleAvatar(
                radius: Dimensions.size4x,
                child: Icon(
                  Icons.person,
                  size: Dimensions.size4x,
                ),
              ),
              const SizedBox(
                height: Dimensions.marginBig,
              ),
              GiveAwaySignInWithButton.google(
                onPressed: () {
                  _registrationCubit.googleSignIn();
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
              GiveAwayTextFormField.email(
                labelText: context.localization!.email,
                controller: _emailController,
              ),
              const SizedBox(
                height: Dimensions.marginDefault,
              ),
              GiveAwayTextFormField.password(
                labelText: context.localization!.password,
                controller: _passwordController,
              ),
              const SizedBox(
                height: Dimensions.marginDefault,
              ),
              GiveAwayTextFormField.password(
                labelText: context.localization!.confirm_password,
                controller: _confirmPasswordController,
              ),
              const SizedBox(
                height: Dimensions.marginDefault,
              ),
              GiveAwayTextFormField.name(
                labelText: context.localization!.firstname,
                controller: _firstname,
              ),
              const SizedBox(
                height: Dimensions.marginDefault,
              ),
              GiveAwayTextFormField.name(
                labelText: context.localization!.lastname,
                controller: _lastname,
              ),
              const SizedBox(
                height: Dimensions.marginDefault,
              ),
              GestureDetector(
                onTap: () {},
                child: GiveAwayTextFormField.date(
                  labelText: context.localization!.birth_date,
                  controller: _birthDate,
                ),
              ),
              const SizedBox(
                height: Dimensions.marginRegular,
              ),
              GiveAwayButton.text(
                onPressed: () {},
                text: context.localization!.register,
              ),
              const SizedBox(
                height: Dimensions.marginRegular,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
