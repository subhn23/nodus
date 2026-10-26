import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_palettes.dart';
import 'theme_state.dart';

/// Cubit managing application theme and typography transitions.
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  /// Switch to a different curated palette by [NodusThemeId].
  void setTheme(NodusThemeId themeId) {
    final palette = NodusThemePalettes.getPalette(themeId);
    emit(state.copyWith(currentTheme: palette));
  }

  /// Switch active monospace font family.
  void setFontFamily(String fontFamily) {
    emit(state.copyWith(fontFamily: fontFamily));
  }

  /// Toggle font ligatures on or off.
  void toggleLigatures() {
    emit(state.copyWith(useLigatures: !state.useLigatures));
  }
}
