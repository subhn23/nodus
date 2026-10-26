import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nodus/core/theme/carbon_hud_theme.dart';
import 'package:nodus/core/theme/theme_palettes.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  group('CarbonHUDTheme & Palettes', () {
    test('defines all 12 curated themes (7 dark, 5 light)', () {
      expect(NodusThemeId.values.length, equals(12));

      final darkThemes = NodusThemePalettes.allThemes.where((t) => t.isDark).toList();
      final lightThemes = NodusThemePalettes.allThemes.where((t) => !t.isDark).toList();

      expect(darkThemes.length, equals(7));
      expect(lightThemes.length, equals(5));
    });

    test('Hack The Box is the default theme with exact specification colors', () {
      final htb = NodusThemePalettes.getPalette(NodusThemeId.hackTheBox);
      expect(htb.id, equals(NodusThemeId.hackTheBox));
      expect(htb.isDark, isTrue);
      expect(htb.background, equals(const Color(0xFF0F1923)));
      expect(htb.surface, equals(const Color(0xFF1B2738)));
      expect(htb.accent, equals(const Color(0xFF9FEF00)));
      expect(htb.danger, equals(const Color(0xFFFF3E3E)));
    });

    test('GitHub Light has crisp engineering paper colors', () {
      final gh = NodusThemePalettes.getPalette(NodusThemeId.gitHubLight);
      expect(gh.id, equals(NodusThemeId.gitHubLight));
      expect(gh.isDark, isFalse);
      expect(gh.background, equals(const Color(0xFFFFFFFF)));
      expect(gh.surface, equals(const Color(0xFFF6F8FA)));
      expect(gh.accent, equals(const Color(0xFF0969DA)));
    });

    test('ThemeExtension copyWith works as expected', () {
      final htb = NodusThemePalettes.getPalette(NodusThemeId.hackTheBox);
      final modified = htb.copyWith(accent: const Color(0xFF00FF00));
      expect(modified.accent, equals(const Color(0xFF00FF00)));
      expect(modified.background, equals(htb.background));
    });

    test('ThemeExtension lerp interpolates between two palettes', () {
      final htb = NodusThemePalettes.getPalette(NodusThemeId.hackTheBox);
      final gh = NodusThemePalettes.getPalette(NodusThemeId.gitHubLight);

      final lerped = htb.lerp(gh, 0.4);
      expect(lerped, isNotNull);
      expect(lerped.id, equals(htb.id));
    });

    test('creates valid ThemeData with extensions registered', () {
      final htb = NodusThemePalettes.getPalette(NodusThemeId.hackTheBox);
      final themeData = htb.toThemeData();

      expect(themeData.brightness, equals(Brightness.dark));
      expect(themeData.scaffoldBackgroundColor, equals(htb.background));

      final extension = themeData.extension<CarbonHUDTheme>();
      expect(extension, isNotNull);
      expect(extension!.accent, equals(htb.accent));
    });
  });
}
