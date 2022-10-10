part of 'theme_cubit.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    @Default(ThemeMode.light) ThemeMode themeMode,
  }) = _ThemeState;
}
