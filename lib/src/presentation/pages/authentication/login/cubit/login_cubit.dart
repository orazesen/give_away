import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:give_away/src/domain/repositories/i_user_repository.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._userRepository) : super(const _Initial());

  final IUserRepository _userRepository;

  Future<void> googleSignIn() async {
    _userRepository.googleSignIn();
  }
}
