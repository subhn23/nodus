import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/carbon_hud_theme.dart';
import 'core/theme/theme_cubit.dart';
import 'core/theme/theme_palettes.dart';
import 'core/theme/theme_state.dart';
import 'core/window/window_service.dart';
import 'core/window/window_title_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WindowService.initialize();
  runApp(const NodusApp());
}

/// Root Nodus application shell.
class NodusApp extends StatelessWidget {
  const NodusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Nodus',
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            home: const NodusWorkspaceShell(),
          );
        },
      ),
    );
  }
}

/// Nodus workspace shell containing window title bar and initial placeholder HUD.
class NodusWorkspaceShell extends StatelessWidget {
  const NodusWorkspaceShell({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CarbonHUDTheme>() ??
        NodusThemePalettes.hackTheBox;

    return Scaffold(
      backgroundColor: theme.background,
      body: SafeArea(
        child: Column(
          children: [
            // Custom Desktop / Platform-Adaptive Window Title Bar
            const WindowTitleBar(
              breadcrumbs: ['Workspace', 'Engineering Notes', 'Quick Start'],
            ),

            // Main View Area (Will host the 3-pane multi_split_view in Milestone 5)
            Expanded(
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 580),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: theme.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: theme.border),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.terminal, color: theme.accent, size: 22),
                          const SizedBox(width: 10),
                          Text(
                            'NODUS TECHNICAL WORKSPACE',
                            style: TextStyle(
                              color: theme.textPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Local-first, sovereign workspace ready for Milestone 3 (Drift SQLite & CAS).',
                        style: TextStyle(
                          color: theme.textSecondary,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 18),
                      // Theme Selector Dropdown
                      Row(
                        children: [
                          Text(
                            'Active Theme:',
                            style: TextStyle(
                              color: theme.textSecondary,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 12),
                          DropdownButton<NodusThemeId>(
                            value: theme.id,
                            dropdownColor: theme.surfaceElevated,
                            underline: const SizedBox(),
                            style: TextStyle(color: theme.textPrimary, fontSize: 12),
                            items: NodusThemePalettes.allThemes.map((t) {
                              return DropdownMenuItem(
                                value: t.id,
                                child: Text(t.displayName),
                              );
                            }).toList(),
                            onChanged: (newThemeId) {
                              if (newThemeId != null) {
                                context.read<ThemeCubit>().setTheme(newThemeId);
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
