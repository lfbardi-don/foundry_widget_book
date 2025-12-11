import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foundry_ds/foundry_ds.dart';
import '../shared/shared.dart';

class ColorsShowcase extends StatelessWidget {
  const ColorsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = FoundryTheme.of(context).colors;

    return ShowcaseScaffold(
      title: 'Colors',
      children: [
        _buildSection('Backgrounds', [
          _ColorItem('Canvas', colors.bg.canvas),
          _ColorItem('Muted', colors.bg.muted),
          _ColorItem('Emphasis', colors.bg.emphasis),
          _ColorItem('Inverted', colors.bg.inverted),
          _ColorItem('Positive', colors.bg.positive),
          _ColorItem('Negative', colors.bg.negative),
          _ColorItem('Warning', colors.bg.warning),
          _ColorItem('Info', colors.bg.info),
        ]),
        const FoundryGap.xl(),
        _buildSection('Foregrounds', [
          _ColorItem('Primary', colors.fg.primary),
          _ColorItem('Secondary', colors.fg.secondary),
          _ColorItem('Muted', colors.fg.muted),
          _ColorItem('Inverted', colors.fg.inverted),
          _ColorItem('Accent', colors.fg.accent),
          _ColorItem('Link', colors.fg.link),
          _ColorItem('Positive', colors.fg.positive),
          _ColorItem('Negative', colors.fg.negative),
          _ColorItem('Warning', colors.fg.warning),
        ]),
        const FoundryGap.xl(),
        _buildSection('Borders', [
          _ColorItem('Base', colors.border.base),
          _ColorItem('Muted', colors.border.muted),
          _ColorItem('Strong', colors.border.strong),
          _ColorItem('Focus', colors.border.focus),
          _ColorItem('Accent', colors.border.accent),
          _ColorItem('Positive', colors.border.positive),
          _ColorItem('Negative', colors.border.negative),
        ]),
        const FoundryGap.xl(),
        _buildSection('Accents', [
          _ColorItem('Base', colors.accent.base),
          _ColorItem('Hover', colors.accent.hover),
          _ColorItem('Active', colors.accent.active),
          _ColorItem('Subtle', colors.accent.subtle),
          _ColorItem('Foreground', colors.accent.fg),
        ]),
        const FoundryGap.xxl(),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return ComponentPreview(
      title: title,
      content: Wrap(spacing: FSpacing.md, runSpacing: FSpacing.md, children: children),
    );
  }
}

class _ColorItem extends StatefulWidget {
  final String name;
  final Color color;

  const _ColorItem(this.name, this.color);

  @override
  State<_ColorItem> createState() => _ColorItemState();
}

class _ColorItemState extends State<_ColorItem> {
  bool _copied = false;

  String get _hexValue {
    return '#${widget.color.toARGB32().toRadixString(16).substring(2).toUpperCase()}';
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _hexValue));
    setState(() => _copied = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = FoundryTheme.of(context);
    final colors = theme.colors;

    return GestureDetector(
      onTap: _copyToClipboard,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: FoundryVStack.xs(
          children: [
            AnimatedContainer(
              duration: theme.motion.fast,
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: widget.color,
                border: Border.all(color: _copied ? colors.accent.base : colors.border.muted, width: _copied ? 2 : 1),
                borderRadius: BorderRadius.circular(theme.radius.md),
                boxShadow: _copied
                    ? [BoxShadow(color: colors.accent.base.withValues(alpha: 0.3), blurRadius: 8)]
                    : null,
              ),
              child: _copied
                  ? Center(
                      child: Icon(LucideIcons.check, color: _getContrastColor(widget.color), size: FIconSize.md),
                    )
                  : null,
            ),
            FoundryText.caption(widget.name),
            FoundryText.caption(
              _copied ? 'Copied!' : _hexValue,
              color: _copied ? colors.accent.base : colors.fg.muted,
              weight: _copied ? FontWeight.w600 : null,
            ),
          ],
        ),
      ),
    );
  }

  Color _getContrastColor(Color color) {
    final luminance = (0.299 * color.r + 0.587 * color.g + 0.114 * color.b);
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
