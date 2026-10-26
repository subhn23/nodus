import 'package:flutter/material.dart';
import 'package:nodus/core/theme/carbon_hud_theme.dart';
import 'package:nodus/core/window/window_title_bar.dart';

/// Standalone showcase widget used for visual verification and Golden Tests.
class ThemeShowcaseWidget extends StatelessWidget {
  final CarbonHUDTheme theme;
  final bool useGoogleFonts;

  const ThemeShowcaseWidget({
    super.key,
    required this.theme,
    this.useGoogleFonts = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.toThemeData(useGoogleFonts: useGoogleFonts),
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Window Title Bar
            WindowTitleBar(
              breadcrumbs: const ['Infrastructure', 'Security', 'Vault Access'],
              isDesktop: true,
              onMinimize: () {},
              onMaximize: () {},
              onClose: () {},
            ),

            // Showcase HUD Body
            Expanded(
              child: Container(
                color: theme.background,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Theme Name Badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: theme.surfaceElevated,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: theme.border),
                      ),
                      child: Text(
                        'THEME: ${theme.displayName.toUpperCase()}',
                        style: TextStyle(
                          color: theme.accent,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Card Simulation
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: theme.surface,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: theme.border),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Active Node Connection',
                            style: TextStyle(
                              color: theme.textPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Local SQLite WAL database connected with FTS5 search index.',
                            style: TextStyle(
                              color: theme.textSecondary,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              _StatusTag(label: 'SUCCESS', color: theme.success),
                              const SizedBox(width: 8),
                              _StatusTag(label: 'WARNING', color: theme.warning),
                              const SizedBox(width: 8),
                              _StatusTag(label: 'DANGER', color: theme.danger),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusTag extends StatelessWidget {
  final String label;
  final Color color;

  const _StatusTag({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
