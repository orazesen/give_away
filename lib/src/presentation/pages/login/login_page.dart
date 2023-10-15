import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:give_away/app/localization/localizations.dart';
import 'package:give_away/src/presentation/shared/widgets/give_away_text_form_field.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              context.localization!.login,
            ),
            GiveAwayTextFormField.email(
              controller: _emailController,
            ),
            TextFormField(
              controller: _passwordController,
            ),
          ],
        ),
      ),
    );
  }
}
