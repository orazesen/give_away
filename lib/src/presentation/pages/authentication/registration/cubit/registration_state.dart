part of 'registration_cubit.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState.initial() = _Initial;
  const factory RegistrationState.loading() = _Loading;
  const factory RegistrationState.signedUp({required String userId}) =
      _SignedUp;
  const factory RegistrationState.confirmed() = _Confirmed;
  const factory RegistrationState.created() = _Created;
  const factory RegistrationState.failed() = _Failed;
}
