import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:give_away/src/domain/repositories/i_user_repository.dart';
import 'package:injectable/injectable.dart';

part 'registration_state.dart';
part 'registration_cubit.freezed.dart';

@injectable
class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this._userRepository) : super(const _Initial());

  final IUserRepository _userRepository;

  Future<void> googleSignIn() async {
    await _userRepository.googleSignIn();
  }
}
