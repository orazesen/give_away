import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:give_away/src/core/enums.dart';
import 'package:injectable/injectable.dart';
import 'package:give_away/src/domain/repositories/i_local_data_repository.dart';

part 'onboarding_state.dart';
part 'onboarding_cubit.freezed.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this._localDataRepository) : super(const _Initial());

  final ILocalDataRepository _localDataRepository;

  Future<void> checkUserState() async {
    emit(const _Loading());
    await Future.delayed(const Duration(seconds: 1));
    final hasOnboardingSeen = _localDataRepository.getOnboardingSeen();

    if (hasOnboardingSeen) {
      //TODO Check user state if exist send to main page else send to sign in page
      ///if(userExist){
      ///emit(const _Succeeded(giveAwayOnboardingRoutes: GiveAwayOnboardingRoutes.main));
      ///}
      ///else{
      emit(const _Succeeded(
          giveAwayOnboardingRoutes: GiveAwayOnboardingRoutes.signIn));

      ///}
    } else {
      emit(const _Failed());
    }

    await _localDataRepository.setOnboardingSeen();
  }
}
