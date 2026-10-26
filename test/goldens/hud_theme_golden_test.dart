import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nodus/core/theme/theme_palettes.dart';
import 'theme_showcase_widget.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  group('HUD Theme Golden Tests', () {
    testWidgets('Hack The Box Dark theme golden snapshot', (tester) async {
      tester.view.physicalSize = const Size(800, 480);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        const ThemeShowcaseWidget(theme: NodusThemePalettes.hackTheBox),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(ThemeShowcaseWidget),
        matchesGoldenFile('goldens/hack_the_box_theme.png'),
      );
    });

    testWidgets('GitHub Light theme golden snapshot', (tester) async {
      tester.view.physicalSize = const Size(800, 480);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        const ThemeShowcaseWidget(theme: NodusThemePalettes.gitHubLight),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(ThemeShowcaseWidget),
        matchesGoldenFile('goldens/github_light_theme.png'),
      );
    });
  });
}
