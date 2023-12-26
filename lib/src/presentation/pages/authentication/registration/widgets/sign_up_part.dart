part of '../registration_page.dart';

class _SignUpPart extends StatelessWidget {
  _SignUpPart({
    required this.loginCubit,
    required this.registrationCubit,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.tabController,
  });

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginCubit loginCubit;
  final RegistrationCubit registrationCubit;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return _ScrollViewPart(
      formKey: formKey,
      children: [
        const SizedBox(
          height: Dimensions.marginDefault,
        ),
        GiveAwayTextFormField.email(
          labelText: context.localization.email,
          controller: emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.localization.field_must_be_filled;
            }
            return Validator.emailValidation(
              value: value,
              errorText: context.localization.email_not_valid,
            );
          },
        ),
        const SizedBox(
          height: Dimensions.marginDefault,
        ),
        GiveAwayTextFormField.password(
          labelText: context.localization.password,
          controller: passwordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.localization.field_must_be_filled;
            }
            return Validator.passwordValidation(
              value: value,
              errorText: context.localization.password_not_valid,
            );
          },
        ),
        const SizedBox(
          height: Dimensions.marginDefault,
        ),
        GiveAwayTextFormField.password(
          labelText: context.localization.confirm_password,
          controller: confirmPasswordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.localization.field_must_be_filled;
            } else if (confirmPasswordController.text !=
                passwordController.text) {
              return context.localization.password_not_matched;
            }
            return null;
          },
        ),
        const SizedBox(
          height: Dimensions.marginRegular,
        ),
        GiveAwaySignInWithButton.google(
          onPressed: () {
            loginCubit.googleSignIn();
          },
          isLoading: false,
        ),
        const SizedBox(
          height: Dimensions.marginDefault,
        ),
        if (defaultTargetPlatform == TargetPlatform.iOS)
          GiveAwaySignInWithButton.apple(
            onPressed: () {
              loginCubit.appleSignIn();
            },
            isLoading: false,
          ),
        const SizedBox(
          height: Dimensions.marginDefault,
        ),
        GiveAwayButton.text(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              registrationCubit.singUp(
                  email: emailController.text,
                  password: passwordController.text);
            }
          },
          text: context.localization.sign_up,
        ),
      ],
    );
  }
}
