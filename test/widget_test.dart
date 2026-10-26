import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nodus/core/theme/theme_palettes.dart';
import 'package:nodus/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  testWidgets('NodusApp renders title bar and active theme selector', (tester) async {
    await tester.pumpWidget(const NodusApp());
    await tester.pumpAndSettle();

    expect(find.text('Workspace'), findsOneWidget);
    expect(find.text('Engineering Notes'), findsOneWidget);
    expect(find.text('Quick Start'), findsOneWidget);
    expect(find.text('NODUS TECHNICAL WORKSPACE'), findsOneWidget);
    expect(find.byType(DropdownButton<NodusThemeId>), findsOneWidget);
  });
}
