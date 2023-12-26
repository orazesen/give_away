import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:give_away/src/domain/enteties/app_user.dart';
import 'package:give_away/src/domain/repositories/i_user_repository.dart';
import 'package:injectable/injectable.dart';

part 'registration_state.dart';
part 'registration_cubit.freezed.dart';

@injectable
class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this._userRepository) : super(const _Initial());

  final IUserRepository _userRepository;

  Future<void> singUp({required String email, required String password}) async {
    try {
      emit(const _Loading());
      final id = await _userRepository.signUp(email: email, password: password);
      if (id != null) {
        emit(_SignedUp(userId: id));
      } else {
        emit(const _Failed());
      }
    } catch (e) {
      emit(const _Failed());
    }
  }

  Future<void> resendEmail({required String email}) async {
    try {
      await _userRepository.resendEmail(email: email);
    } catch (e) {
      emit(const _Failed());
    }
  }

  Future<void> checkEmailConfirmation(
      {required String email, required String password}) async {
    try {
      emit(const _Loading());
      final isConfirmed = await _userRepository.checkEmailConfirmation(
        email: email,
        password: password,
      );
      if (isConfirmed) {
        emit(const _Confirmed());
      } else {
        emit(const _Failed());
      }
    } catch (e) {
      emit(const _Failed());
    }
  }

  Future<void> createUser({required AppUser appUser}) async {
    try {
      emit(const _Loading());
      await _userRepository.createUser(appUser: appUser);
      emit(const _Created());
    } catch (e) {
      emit(const _Failed());
    }
  }
}
