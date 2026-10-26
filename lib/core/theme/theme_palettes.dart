import 'package:flutter/material.dart';
import 'carbon_hud_theme.dart';

/// Available curated theme identifiers.
enum NodusThemeId {
  // 7 Dark Themes
  hackTheBox,
  tokyoNight,
  oneDarkPro,
  catppuccinMocha,
  dracula,
  nord,
  gruvboxDark,

  // 5 Light Themes
  gitHubLight,
  catppuccinLatte,
  tokyoNightDay,
  solarizedLight,
  oneLight,
}

/// Curated high-contrast theme definitions for Nodus.
class NodusThemePalettes {
  // ---------------------------------------------------------------------------
  // 1. Hack The Box (Default)
  // ---------------------------------------------------------------------------
  static const hackTheBox = CarbonHUDTheme(
    id: NodusThemeId.hackTheBox,
    displayName: 'Hack The Box',
    isDark: true,
    background: Color(0xFF0F1923),
    surface: Color(0xFF1B2738),
    surfaceElevated: Color(0xFF243447),
    border: Color(0xFF2A3F55),
    accent: Color(0xFF9FEF00),
    textPrimary: Color(0xFFE2E8F0),
    textSecondary: Color(0xFF8899A6),
    codeBg: Color(0xFF131F2C),
    danger: Color(0xFFFF3E3E),
    warning: Color(0xFFFFB800),
    success: Color(0xFF9FEF00),
    info: Color(0xFF00D2FF),
  );

  // ---------------------------------------------------------------------------
  // 2. Tokyo Night
  // ---------------------------------------------------------------------------
  static const tokyoNight = CarbonHUDTheme(
    id: NodusThemeId.tokyoNight,
    displayName: 'Tokyo Night',
    isDark: true,
    background: Color(0xFF1A1B26),
    surface: Color(0xFF24283B),
    surfaceElevated: Color(0xFF2F3549),
    border: Color(0xFF3B4261),
    accent: Color(0xFF7AA2F7),
    textPrimary: Color(0xFFC0CAF5),
    textSecondary: Color(0xFF565F89),
    codeBg: Color(0xFF16161E),
    danger: Color(0xFFF7768E),
    warning: Color(0xFFE0AF68),
    success: Color(0xFF9ECE6A),
    info: Color(0xFF7DCFFF),
  );

  // ---------------------------------------------------------------------------
  // 3. One Dark Pro
  // ---------------------------------------------------------------------------
  static const oneDarkPro = CarbonHUDTheme(
    id: NodusThemeId.oneDarkPro,
    displayName: 'One Dark Pro',
    isDark: true,
    background: Color(0xFF282C34),
    surface: Color(0xFF21252B),
    surfaceElevated: Color(0xFF2C313C),
    border: Color(0xFF3E4451),
    accent: Color(0xFF61AFEF),
    textPrimary: Color(0xFFABB2BF),
    textSecondary: Color(0xFF5C6370),
    codeBg: Color(0xFF1E2227),
    danger: Color(0xFFE06C75),
    warning: Color(0xFFE5C07B),
    success: Color(0xFF98C379),
    info: Color(0xFF56B6C2),
  );

  // ---------------------------------------------------------------------------
  // 4. Catppuccin Mocha
  // ---------------------------------------------------------------------------
  static const catppuccinMocha = CarbonHUDTheme(
    id: NodusThemeId.catppuccinMocha,
    displayName: 'Catppuccin Mocha',
    isDark: true,
    background: Color(0xFF1E1E2E),
    surface: Color(0xFF181825),
    surfaceElevated: Color(0xFF313244),
    border: Color(0xFF45475A),
    accent: Color(0xFFCBA6F7),
    textPrimary: Color(0xFFCDD6F4),
    textSecondary: Color(0xFFA6ADC8),
    codeBg: Color(0xFF11111B),
    danger: Color(0xFFF38BA8),
    warning: Color(0xFFF9E2AF),
    success: Color(0xFFA6E3A1),
    info: Color(0xFF89DCEB),
  );

  // ---------------------------------------------------------------------------
  // 5. Dracula
  // ---------------------------------------------------------------------------
  static const dracula = CarbonHUDTheme(
    id: NodusThemeId.dracula,
    displayName: 'Dracula',
    isDark: true,
    background: Color(0xFF282A36),
    surface: Color(0xFF21222C),
    surfaceElevated: Color(0xFF44475A),
    border: Color(0xFF6272A4),
    accent: Color(0xFFBD93F9),
    textPrimary: Color(0xFFF8F8F2),
    textSecondary: Color(0xFF6272A4),
    codeBg: Color(0xFF1E1F29),
    danger: Color(0xFFFF5555),
    warning: Color(0xFFF1FA8C),
    success: Color(0xFF50FA7B),
    info: Color(0xFF8BE9FD),
  );

  // ---------------------------------------------------------------------------
  // 6. Nord
  // ---------------------------------------------------------------------------
  static const nord = CarbonHUDTheme(
    id: NodusThemeId.nord,
    displayName: 'Nord',
    isDark: true,
    background: Color(0xFF2E3440),
    surface: Color(0xFF3B4252),
    surfaceElevated: Color(0xFF434C5E),
    border: Color(0xFF4C566A),
    accent: Color(0xFF88C0D0),
    textPrimary: Color(0xFFECEFF4),
    textSecondary: Color(0xFFD8DEE9),
    codeBg: Color(0xFF242933),
    danger: Color(0xFFBF616A),
    warning: Color(0xFFEBCB8B),
    success: Color(0xFFA3BE8C),
    info: Color(0xFF81A1C1),
  );

  // ---------------------------------------------------------------------------
  // 7. Gruvbox Dark
  // ---------------------------------------------------------------------------
  static const gruvboxDark = CarbonHUDTheme(
    id: NodusThemeId.gruvboxDark,
    displayName: 'Gruvbox Dark',
    isDark: true,
    background: Color(0xFF282828),
    surface: Color(0xFF1D2021),
    surfaceElevated: Color(0xFF3C3836),
    border: Color(0xFF504945),
    accent: Color(0xFFFE8019),
    textPrimary: Color(0xFFEBDBB2),
    textSecondary: Color(0xFFA89984),
    codeBg: Color(0xFF141617),
    danger: Color(0xFFFB4934),
    warning: Color(0xFFFABD2F),
    success: Color(0xFFB8BB26),
    info: Color(0xFF83A598),
  );

  // ---------------------------------------------------------------------------
  // 8. GitHub Light / Primer
  // ---------------------------------------------------------------------------
  static const gitHubLight = CarbonHUDTheme(
    id: NodusThemeId.gitHubLight,
    displayName: 'GitHub Light',
    isDark: false,
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFF6F8FA),
    surfaceElevated: Color(0xFFEAEEF2),
    border: Color(0xFFD0D7DE),
    accent: Color(0xFF0969DA),
    textPrimary: Color(0xFF1F2328),
    textSecondary: Color(0xFF656D76),
    codeBg: Color(0xFFF6F8FA),
    danger: Color(0xFFCF222E),
    warning: Color(0xFF9A6700),
    success: Color(0xFF1A7F37),
    info: Color(0xFF0969DA),
  );

  // ---------------------------------------------------------------------------
  // 9. Catppuccin Latte
  // ---------------------------------------------------------------------------
  static const catppuccinLatte = CarbonHUDTheme(
    id: NodusThemeId.catppuccinLatte,
    displayName: 'Catppuccin Latte',
    isDark: false,
    background: Color(0xFFEFF1F5),
    surface: Color(0xFFE6E9EF),
    surfaceElevated: Color(0xFFDCE0E8),
    border: Color(0xFFCCD0DA),
    accent: Color(0xFF1E66F5),
    textPrimary: Color(0xFF4C4F69),
    textSecondary: Color(0xFF6C6F85),
    codeBg: Color(0xFFE6E9EF),
    danger: Color(0xFFD20F39),
    warning: Color(0xFFDF8E1D),
    success: Color(0xFF40A02B),
    info: Color(0xFF04A5E5),
  );

  // ---------------------------------------------------------------------------
  // 10. Tokyo Night Day
  // ---------------------------------------------------------------------------
  static const tokyoNightDay = CarbonHUDTheme(
    id: NodusThemeId.tokyoNightDay,
    displayName: 'Tokyo Night Day',
    isDark: false,
    background: Color(0xFFE1E2E7),
    surface: Color(0xFFD0D5E6),
    surfaceElevated: Color(0xFFC4C8D8),
    border: Color(0xFFB4B8C8),
    accent: Color(0xFF3760BF),
    textPrimary: Color(0xFF3760BF),
    textSecondary: Color(0xFF6172B0),
    codeBg: Color(0xFFD5D7E0),
    danger: Color(0xFFF52A65),
    warning: Color(0xFF8C6C3E),
    success: Color(0xFF587539),
    info: Color(0xFF007197),
  );

  // ---------------------------------------------------------------------------
  // 11. Solarized Light
  // ---------------------------------------------------------------------------
  static const solarizedLight = CarbonHUDTheme(
    id: NodusThemeId.solarizedLight,
    displayName: 'Solarized Light',
    isDark: false,
    background: Color(0xFFFDF6E3),
    surface: Color(0xFFEEE8D5),
    surfaceElevated: Color(0xFFE0DCC8),
    border: Color(0xFFD33682),
    accent: Color(0xFF268BD2),
    textPrimary: Color(0xFF657B83),
    textSecondary: Color(0xFF93A1A1),
    codeBg: Color(0xFFEEE8D5),
    danger: Color(0xFFDC322F),
    warning: Color(0xFFB58900),
    success: Color(0xFF859900),
    info: Color(0xFF2AA198),
  );

  // ---------------------------------------------------------------------------
  // 12. One Light
  // ---------------------------------------------------------------------------
  static const oneLight = CarbonHUDTheme(
    id: NodusThemeId.oneLight,
    displayName: 'One Light',
    isDark: false,
    background: Color(0xFFFAFAFA),
    surface: Color(0xFFF0F0F0),
    surfaceElevated: Color(0xFFE5E5E5),
    border: Color(0xFFE5E5E6),
    accent: Color(0xFF4078F2),
    textPrimary: Color(0xFF383A42),
    textSecondary: Color(0xFFA0A1A7),
    codeBg: Color(0xFFEAEAEA),
    danger: Color(0xFFE45649),
    warning: Color(0xFFC18401),
    success: Color(0xFF50A14F),
    info: Color(0xFF0184BC),
  );

  /// All 12 curated themes in order.
  static const List<CarbonHUDTheme> allThemes = [
    hackTheBox,
    tokyoNight,
    oneDarkPro,
    catppuccinMocha,
    dracula,
    nord,
    gruvboxDark,
    gitHubLight,
    catppuccinLatte,
    tokyoNightDay,
    solarizedLight,
    oneLight,
  ];

  /// Find palette by ID.
  static CarbonHUDTheme getPalette(NodusThemeId id) {
    return allThemes.firstWhere(
      (theme) => theme.id == id,
      orElse: () => hackTheBox,
    );
  }
}
