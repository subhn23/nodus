import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme_palettes.dart';

/// Carbon HUD high-density technical theme extension.
class CarbonHUDTheme extends ThemeExtension<CarbonHUDTheme> {
  final NodusThemeId id;
  final String displayName;
  final bool isDark;

  // Background and Surfaces
  final Color background;
  final Color surface;
  final Color surfaceElevated;
  final Color border;

  // Accents and Text
  final Color accent;
  final Color textPrimary;
  final Color textSecondary;
  final Color codeBg;

  // Status and Alerts
  final Color danger;
  final Color warning;
  final Color success;
  final Color info;

  const CarbonHUDTheme({
    required this.id,
    required this.displayName,
    required this.isDark,
    required this.background,
    required this.surface,
    required this.surfaceElevated,
    required this.border,
    required this.accent,
    required this.textPrimary,
    required this.textSecondary,
    required this.codeBg,
    required this.danger,
    required this.warning,
    required this.success,
    required this.info,
  });

  @override
  CarbonHUDTheme copyWith({
    NodusThemeId? id,
    String? displayName,
    bool? isDark,
    Color? background,
    Color? surface,
    Color? surfaceElevated,
    Color? border,
    Color? accent,
    Color? textPrimary,
    Color? textSecondary,
    Color? codeBg,
    Color? danger,
    Color? warning,
    Color? success,
    Color? info,
  }) {
    return CarbonHUDTheme(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      isDark: isDark ?? this.isDark,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceElevated: surfaceElevated ?? this.surfaceElevated,
      border: border ?? this.border,
      accent: accent ?? this.accent,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      codeBg: codeBg ?? this.codeBg,
      danger: danger ?? this.danger,
      warning: warning ?? this.warning,
      success: success ?? this.success,
      info: info ?? this.info,
    );
  }

  @override
  CarbonHUDTheme lerp(ThemeExtension<CarbonHUDTheme>? other, double t) {
    if (other is! CarbonHUDTheme) return this;
    return CarbonHUDTheme(
      id: t < 0.5 ? id : other.id,
      displayName: t < 0.5 ? displayName : other.displayName,
      isDark: t < 0.5 ? isDark : other.isDark,
      background: Color.lerp(background, other.background, t) ?? background,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      surfaceElevated: Color.lerp(surfaceElevated, other.surfaceElevated, t) ?? surfaceElevated,
      border: Color.lerp(border, other.border, t) ?? border,
      accent: Color.lerp(accent, other.accent, t) ?? accent,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t) ?? textPrimary,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t) ?? textSecondary,
      codeBg: Color.lerp(codeBg, other.codeBg, t) ?? codeBg,
      danger: Color.lerp(danger, other.danger, t) ?? danger,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      success: Color.lerp(success, other.success, t) ?? success,
      info: Color.lerp(info, other.info, t) ?? info,
    );
  }

  /// Converts this Carbon HUD palette into a complete Flutter [ThemeData].
  ThemeData toThemeData({
    String fontFamily = 'Fira Code',
    bool useGoogleFonts = true,
  }) {
    final brightness = isDark ? Brightness.dark : Brightness.light;

    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: accent,
      onPrimary: isDark ? Colors.black : Colors.white,
      secondary: accent,
      onSecondary: isDark ? Colors.black : Colors.white,
      error: danger,
      onError: Colors.white,
      surface: surface,
      onSurface: textPrimary,
      surfaceContainerHighest: surfaceElevated,
      outline: border,
    );

    final baseTextTheme = brightness == Brightness.dark
        ? Typography.material2021().white
        : Typography.material2021().black;

    final TextTheme textTheme;
    if (useGoogleFonts) {
      textTheme = GoogleFonts.interTextTheme(baseTextTheme).copyWith(
        bodyLarge: GoogleFonts.inter(color: textPrimary, fontSize: 14),
        bodyMedium: GoogleFonts.inter(color: textPrimary, fontSize: 13),
        bodySmall: GoogleFonts.inter(color: textSecondary, fontSize: 12),
        titleLarge: GoogleFonts.inter(color: textPrimary, fontWeight: FontWeight.bold, fontSize: 18),
        titleMedium: GoogleFonts.inter(color: textPrimary, fontWeight: FontWeight.w600, fontSize: 15),
        titleSmall: GoogleFonts.inter(color: textSecondary, fontWeight: FontWeight.w500, fontSize: 13),
      );
    } else {
      textTheme = baseTextTheme.copyWith(
        bodyLarge: TextStyle(color: textPrimary, fontSize: 14, fontFamily: 'Inter'),
        bodyMedium: TextStyle(color: textPrimary, fontSize: 13, fontFamily: 'Inter'),
        bodySmall: TextStyle(color: textSecondary, fontSize: 12, fontFamily: 'Inter'),
        titleLarge: TextStyle(color: textPrimary, fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'Inter'),
        titleMedium: TextStyle(color: textPrimary, fontWeight: FontWeight.w600, fontSize: 15, fontFamily: 'Inter'),
        titleSmall: TextStyle(color: textSecondary, fontWeight: FontWeight.w500, fontSize: 13, fontFamily: 'Inter'),
      );
    }

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      canvasColor: background,
      dividerColor: border,
      textTheme: textTheme,
      extensions: [this],
      appBarTheme: AppBarTheme(
        backgroundColor: surface,
        foregroundColor: textPrimary,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      iconTheme: IconThemeData(color: textPrimary, size: 18),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: surfaceElevated,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border),
        ),
        textStyle: TextStyle(color: textPrimary, fontSize: 11, fontFamily: 'Inter'),
      ),
    );
  }
}
