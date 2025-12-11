import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foundry_ds/foundry_ds.dart';

class ComponentPreview extends StatefulWidget {
  final String title;
  final String? description;
  final Widget content;
  final String? codeSnippet;

  const ComponentPreview({super.key, required this.title, this.description, required this.content, this.codeSnippet});

  @override
  State<ComponentPreview> createState() => _ComponentPreviewState();
}

class _ComponentPreviewState extends State<ComponentPreview> {
  bool _showCode = false;

  @override
  Widget build(BuildContext context) {
    final theme = FoundryTheme.of(context);
    final colors = theme.colors;

    return FoundryVStack.xs(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FoundryText.headingSmall(widget.title),
            if (widget.codeSnippet != null)
              FoundryButton.icon(
                variant: FoundryButtonVariant.ghost,
                tooltip: _showCode ? 'Hide Code' : 'Show Code',
                onPressed: () => setState(() => _showCode = !_showCode),
                child: Icon(_showCode ? LucideIcons.eyeOff : LucideIcons.code, size: FIconSize.sm),
              ),
          ],
        ),
        if (widget.description != null) ...[
          const FoundryGap.xs(),
          FoundryText.bodySmall(widget.description!, color: colors.fg.secondary),
        ],
        const FoundryGap.md(),
        FoundrySurface.raised(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: FInsets.lg,
                child: Center(child: widget.content),
              ),
              if (_showCode && widget.codeSnippet != null) ...[
                const FoundryDivider(),
                Container(
                  decoration: BoxDecoration(
                    color: colors.bg.muted,
                    borderRadius: BorderRadius.circular(theme.radius.md),
                  ),
                  padding: FInsets.md,
                  child: Stack(
                    children: [
                      SelectableText(
                        widget.codeSnippet!,
                        style: TextStyle(fontFamily: 'monospace', fontSize: 13, color: colors.fg.primary),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: FoundryButton.icon(
                          variant: FoundryButtonVariant.ghost,
                          tooltip: 'Copy Code',
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: widget.codeSnippet!));
                            FoundrySnackbar.show(
                              context: context,
                              message: 'Code copied to clipboard',
                              variant: FoundrySnackbarVariant.positive,
                            );
                          },
                          child: const Icon(LucideIcons.copy, size: FIconSize.xs),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
