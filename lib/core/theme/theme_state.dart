import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'carbon_hud_theme.dart';
import 'theme_palettes.dart';

/// State representing active theme configuration.
class ThemeState extends Equatable {
  final CarbonHUDTheme currentTheme;
  final String fontFamily;
  final bool useLigatures;

  const ThemeState({
    required this.currentTheme,
    this.fontFamily = 'Fira Code',
    this.useLigatures = true,
  });

  /// Factory for initial state defaulting to Hack The Box.
  factory ThemeState.initial() {
    return const ThemeState(
      currentTheme: NodusThemePalettes.hackTheBox,
    );
  }

  /// Derived Flutter [ThemeData].
  ThemeData get themeData => currentTheme.toThemeData(fontFamily: fontFamily);

  ThemeState copyWith({
    CarbonHUDTheme? currentTheme,
    String? fontFamily,
    bool? useLigatures,
  }) {
    return ThemeState(
      currentTheme: currentTheme ?? this.currentTheme,
      fontFamily: fontFamily ?? this.fontFamily,
      useLigatures: useLigatures ?? this.useLigatures,
    );
  }

  @override
  List<Object?> get props => [currentTheme, fontFamily, useLigatures];
}
