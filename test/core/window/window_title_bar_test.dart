import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nodus/core/theme/carbon_hud_theme.dart';
import 'package:nodus/core/theme/theme_palettes.dart';
import 'package:nodus/core/window/window_title_bar.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget buildTestableWidget({
    required Widget child,
    CarbonHUDTheme theme = NodusThemePalettes.hackTheBox,
  }) {
    return MaterialApp(
      theme: theme.toThemeData(),
      home: Scaffold(
        body: Column(
          children: [
            child,
          ],
        ),
      ),
    );
  }

  group('WindowTitleBar', () {
    testWidgets('renders breadcrumbs and title correctly', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: const WindowTitleBar(
            breadcrumbs: ['Architecture', 'Networking', 'Reverse Proxy'],
          ),
        ),
      );

      expect(find.text('Architecture'), findsOneWidget);
      expect(find.text('Networking'), findsOneWidget);
      expect(find.text('Reverse Proxy'), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right), findsNWidgets(2));
    });

    testWidgets('renders fallback branding title when breadcrumbs are empty', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: const WindowTitleBar(),
        ),
      );

      expect(find.text('NODUS'), findsOneWidget);
    });

    testWidgets('renders window control buttons (minimize, maximize, close)', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: const WindowTitleBar(isDesktop: true),
        ),
      );

      expect(find.byKey(const Key('window_control_minimize')), findsOneWidget);
      expect(find.byKey(const Key('window_control_maximize')), findsOneWidget);
      expect(find.byKey(const Key('window_control_close')), findsOneWidget);
    });

    testWidgets('hides window control buttons when not on desktop', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: const WindowTitleBar(isDesktop: false),
        ),
      );

      expect(find.byKey(const Key('window_control_minimize')), findsNothing);
      expect(find.byKey(const Key('window_control_maximize')), findsNothing);
      expect(find.byKey(const Key('window_control_close')), findsNothing);
    });
  });
}
