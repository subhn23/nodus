import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import '../theme/carbon_hud_theme.dart';
import 'window_service.dart';

/// Custom borderless HUD window title bar.
class WindowTitleBar extends StatefulWidget {
  final List<String> breadcrumbs;
  final bool? isDesktop;
  final VoidCallback? onMinimize;
  final VoidCallback? onMaximize;
  final VoidCallback? onClose;

  const WindowTitleBar({
    super.key,
    this.breadcrumbs = const [],
    this.isDesktop,
    this.onMinimize,
    this.onMaximize,
    this.onClose,
  });

  @override
  State<WindowTitleBar> createState() => _WindowTitleBarState();
}

class _WindowTitleBarState extends State<WindowTitleBar> {
  bool _isMaximized = false;

  bool get _isDesktopPlatform => widget.isDesktop ?? WindowService.isDesktop;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CarbonHUDTheme>();
    final surfaceColor = theme?.surface ?? const Color(0xFF1B2738);
    final borderColor = theme?.border ?? const Color(0xFF2A3F55);
    final textPrimary = theme?.textPrimary ?? Colors.white;
    final textSecondary = theme?.textSecondary ?? Colors.grey;
    final accentColor = theme?.accent ?? const Color(0xFF9FEF00);

    final titleBarContent = Container(
      height: 38,
      decoration: BoxDecoration(
        color: surfaceColor,
        border: Border(
          bottom: BorderSide(color: borderColor, width: 1),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          // App Logo / Node Indicator
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: accentColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: accentColor.withValues(alpha: 0.5),
                  blurRadius: 4,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          // Breadcrumbs or fallback branding
          Expanded(
            child: widget.breadcrumbs.isEmpty
                ? Text(
                    'NODUS',
                    style: TextStyle(
                      color: textPrimary,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2.0,
                      fontSize: 12,
                    ),
                  )
                : Row(
                    children: [
                      for (int i = 0; i < widget.breadcrumbs.length; i++) ...[
                        Text(
                          widget.breadcrumbs[i],
                          style: TextStyle(
                            color: i == widget.breadcrumbs.length - 1
                                ? textPrimary
                                : textSecondary,
                            fontWeight: i == widget.breadcrumbs.length - 1
                                ? FontWeight.w600
                                : FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                        if (i < widget.breadcrumbs.length - 1)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Icon(
                              Icons.chevron_right,
                              size: 14,
                              color: textSecondary,
                            ),
                          ),
                      ],
                    ],
                  ),
          ),

          // Desktop Window Controls (Minimize, Maximize, Close)
          if (_isDesktopPlatform) ...[
            _WindowButton(
              key: const Key('window_control_minimize'),
              icon: Icons.horizontal_rule,
              tooltip: 'Minimize',
              hoverColor: Colors.white10,
              onPressed: widget.onMinimize ?? () => windowManager.minimize(),
            ),
            _WindowButton(
              key: const Key('window_control_maximize'),
              icon: _isMaximized ? Icons.filter_none : Icons.crop_square,
              tooltip: _isMaximized ? 'Restore' : 'Maximize',
              hoverColor: Colors.white10,
              onPressed: widget.onMaximize ?? () async {
                final isMax = await windowManager.isMaximized();
                if (isMax) {
                  await windowManager.unmaximize();
                  setState(() => _isMaximized = false);
                } else {
                  await windowManager.maximize();
                  setState(() => _isMaximized = true);
                }
              },
            ),
            _WindowButton(
              key: const Key('window_control_close'),
              icon: Icons.close,
              tooltip: 'Close',
              hoverColor: theme?.danger.withValues(alpha: 0.8) ?? Colors.red,
              onPressed: widget.onClose ?? () => windowManager.close(),
            ),
          ],
        ],
      ),
    );

    if (_isDesktopPlatform) {
      return DragToMoveArea(child: titleBarContent);
    }
    return titleBarContent;
  }
}

class _WindowButton extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final Color hoverColor;
  final VoidCallback onPressed;

  const _WindowButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.hoverColor,
    required this.onPressed,
  });

  @override
  State<_WindowButton> createState() => _WindowButtonState();
}

class _WindowButtonState extends State<_WindowButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CarbonHUDTheme>();
    final iconColor = _isHovered
        ? Colors.white
        : (theme?.textSecondary ?? Colors.grey);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          width: 44,
          height: 38,
          color: _isHovered ? widget.hoverColor : Colors.transparent,
          alignment: Alignment.center,
          child: Icon(
            widget.icon,
            size: 14,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
