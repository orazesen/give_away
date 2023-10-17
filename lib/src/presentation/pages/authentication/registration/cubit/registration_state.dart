part of 'registration_cubit.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState.initial() = _Initial;
  const factory RegistrationState.loading() = _Loading;
  const factory RegistrationState.loaded() = _Loaded;
  const factory RegistrationState.emailReceived(String email) = _EmailReceived;
  const factory RegistrationState.succeeded() = _Succeeded;
  const factory RegistrationState.failed() = _Failed;
}
