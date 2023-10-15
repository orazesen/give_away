import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:give_away/app/router/app_router.gr.dart';
import 'package:give_away/src/core/enums.dart';
import 'package:give_away/src/presentation/pages/onboarding/cubit/onboarding_cubit.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OnboardingCubit, OnboardingState>(
        bloc: context.read<OnboardingCubit>()..checkUserState(),
        listener: (BuildContext context, OnboardingState state) {
          state.maybeWhen(
            orElse: () {},
            succeeded: (giveAwayOnboardingRoutes) {
              switch (giveAwayOnboardingRoutes) {
                case GiveAwayOnboardingRoutes.main:
                  context.router.replace(const MainRoute());
                  break;
                case GiveAwayOnboardingRoutes.signIn:
                  context.router.replace(LoginRoute());
                default:
              }
            },
          );
        },
        builder: (context, state) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Onboarding',
              ),
              ElevatedButton(
                onPressed: () {
                  context.router.replace(LoginRoute());
                },
                child: Text(
                  'Continue',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
