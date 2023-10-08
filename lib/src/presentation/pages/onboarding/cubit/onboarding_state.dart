part of 'onboarding_cubit.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState.initial() = _Initial;
  const factory OnboardingState.loading() = _Loading;
  const factory OnboardingState.succeeded(
          {required GiveAwayOnboardingRoutes giveAwayOnboardingRoutes}) =
      _Succeeded;
  const factory OnboardingState.failed() = _Failed;
}
