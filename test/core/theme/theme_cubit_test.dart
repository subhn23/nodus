import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nodus/core/theme/theme_cubit.dart';
import 'package:nodus/core/theme/theme_palettes.dart';
import 'package:nodus/core/theme/theme_state.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ThemeCubit', () {
    late ThemeCubit themeCubit;

    setUp(() {
      themeCubit = ThemeCubit();
    });

    tearDown(() {
      themeCubit.close();
    });

    test('initial state defaults to Hack The Box theme', () {
      expect(themeCubit.state.currentTheme.id, equals(NodusThemeId.hackTheBox));
      expect(themeCubit.state.fontFamily, equals('Fira Code'));
    });

    blocTest<ThemeCubit, ThemeState>(
      'emits new theme state when setTheme is called',
      build: () => ThemeCubit(),
      act: (cubit) => cubit.setTheme(NodusThemeId.tokyoNight),
      expect: () => [
        predicate<ThemeState>((state) =>
            state.currentTheme.id == NodusThemeId.tokyoNight &&
            state.currentTheme.isDark == true),
      ],
    );

    blocTest<ThemeCubit, ThemeState>(
      'emits light theme when switching to GitHub Light',
      build: () => ThemeCubit(),
      act: (cubit) => cubit.setTheme(NodusThemeId.gitHubLight),
      expect: () => [
        predicate<ThemeState>((state) =>
            state.currentTheme.id == NodusThemeId.gitHubLight &&
            state.currentTheme.isDark == false),
      ],
    );

    blocTest<ThemeCubit, ThemeState>(
      'toggles font family between Fira Code and JetBrains Mono',
      build: () => ThemeCubit(),
      act: (cubit) => cubit.setFontFamily('JetBrains Mono'),
      expect: () => [
        predicate<ThemeState>((state) => state.fontFamily == 'JetBrains Mono'),
      ],
    );
  });
}
