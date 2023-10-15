part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.anonymous() = _Anonymous;
  const factory UserState.loading() = _Loading;
  const factory UserState.authorized() = _Authorized;
  const factory UserState.notVerified() = _NotVerified;
}
