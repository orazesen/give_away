part of 'theme_cubit.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState.initial() = _Initial;
  const factory ThemeState.loading() = _Loading;
  const factory ThemeState.failed() = _Failed;
  const factory ThemeState.succeeded({
    @Default(ThemeType.system) ThemeType currentTheme,
  }) = _Succeeded;
}
