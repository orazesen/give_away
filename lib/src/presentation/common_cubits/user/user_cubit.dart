import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:give_away/src/domain/repositories/i_user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

const String _tag = 'UserCubit';

@injectable
class UserCubit extends Cubit<UserState> {
  UserCubit(this._userRepository) : super(const _Initial()) {
    listenAuthChanges();
  }

  final IUserRepository _userRepository;
  StreamSubscription<AuthState>? _userAuthStream;

  void listenAuthChanges() {
    _userAuthStream = _userRepository.listenAuthChanges().listen((state) {
      log(state.event.name, name: _tag);
      switch (state.event) {
        case AuthChangeEvent.initialSession:
          emit(const _Initial());
          break;
        case AuthChangeEvent.mfaChallengeVerified:
          emit(const _Authorized());
          break;
        case AuthChangeEvent.passwordRecovery:
          emit(const _Authorized());
          break;
        case AuthChangeEvent.signedIn:
          emit(const _Authorized());
          break;
        case AuthChangeEvent.signedOut:
          emit(const _Anonymous());
          break;
        case AuthChangeEvent.tokenRefreshed:
          emit(const _Authorized());
          break;
        case AuthChangeEvent.userDeleted:
          emit(const _Authorized());
          break;
        case AuthChangeEvent.userUpdated:
          emit(const _Authorized());
          break;
        default:
      }
    });
  }

  @override
  Future<void> close() {
    _userAuthStream?.cancel();
    return super.close();
  }
}
