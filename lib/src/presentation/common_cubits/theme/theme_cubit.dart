import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:give_away/src/core/enums.dart';
import 'package:give_away/src/domain/repositories/i_local_data_repository.dart';
import 'package:injectable/injectable.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

@injectable
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this._themeRepository) : super(const _Initial()) {
    getTheme();
  }
  final ILocalDataRepository _themeRepository;

  Future<void> changeTheme(ThemeType themeType) async =>
      _themeRepository.saveThemeType(themeType);

  void getTheme() {
    _themeRepository.theme.listen(
      (theme) {
        emit(
          _Succeeded(
            currentTheme: theme,
          ),
        );
      },
    );
  }
}
