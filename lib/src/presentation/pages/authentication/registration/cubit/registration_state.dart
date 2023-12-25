part of 'registration_cubit.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState.initial() = _Initial;
  const factory RegistrationState.loading() = _Loading;
  const factory RegistrationState.signedUp() = _SignedUp;
  const factory RegistrationState.confirmated(String email) = _Confirmated;
  const factory RegistrationState.created() = _Created;
  const factory RegistrationState.failed() = _Failed;
}
