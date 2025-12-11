import 'package:flutter/material.dart';
import 'package:foundry_ds/foundry_ds.dart';
import '../shared/shared.dart';

class MiscShowcase extends StatelessWidget {
  const MiscShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Misc (Patterns)',
      children: [
        ComponentPreview(
          title: 'Modals',
          description: 'Dialogs demanding user attention or action.',
          codeSnippet: '''
            FoundryModal.show(
              context: context,
              title: 'Example Modal',
              content: const FoundryText.inherit('Modal content here.'),
              actions: [
                FoundryButton(
                  variant: FoundryButtonVariant.ghost,
                  onPressed: () => Navigator.pop(context),
                  child: const FoundryText.inherit('Cancel'),
                ),
                FoundryButton(
                  onPressed: () => Navigator.pop(context),
                  child: const FoundryText.body('Confirm'),
                ),
              ],
            )''',
          content: Wrap(
            spacing: FSpacing.md,
            children: [
              FoundryButton(
                child: const FoundryText.inherit('Show Modal'),
                onPressed: () => FoundryModal.show(
                  context: context,
                  title: 'Example Modal',
                  content: const FoundryText.inherit('This is a modal dialog content.'),
                  actions: [
                    FoundryButton(
                      variant: FoundryButtonVariant.ghost,
                      onPressed: () => Navigator.pop(context),
                      child: const FoundryText.inherit('Cancel'),
                    ),
                    FoundryButton(child: const FoundryText.inherit('Confirm'), onPressed: () => Navigator.pop(context)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Bottom Sheets',
          description: 'Secondary content anchored to the bottom.',
          codeSnippet: '''
            FoundryBottomSheet.show(
              context: context,
              title: 'Example Sheet',
              child: const FoundryVStack.md(
                children: [
                  FoundryText.inherit('Sheet content goes here'),
                ],
              ),
            )''',
          content: Wrap(
            spacing: FSpacing.md,
            children: [
              FoundryButton(
                child: const FoundryText.inherit('Show Bottom Sheet'),
                onPressed: () => FoundryBottomSheet.show(
                  context: context,
                  title: 'Example Sheet',
                  child: const FoundryVStack.md(children: [FoundryText.inherit('Sheet content goes here')]),
                ),
              ),
            ],
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Tooltips',
          description: 'Contextual hints shown on hover or long press.',
          codeSnippet: '''
            FoundryTooltip(
              message: 'Helpful tooltip text',
              child: FoundryText.inherit('Hover for hint'),
            )''',
          content: FoundryTooltip(
            message: 'Tooltips work on any widget.',
            showDuration: const Duration(seconds: 5),
            child: Container(
              padding: FInsets.md,
              decoration: BoxDecoration(
                color: FoundryTheme.of(context).colors.bg.muted,
                borderRadius: BorderRadius.circular(FoundryTheme.of(context).radius.md),
              ),
              child: FoundryHStack.sm(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(FIcons.info, size: FIconSize.md),
                  FoundryText.body('Hover for hint'),
                ],
              ),
            ),
          ),
        ),
        const FoundryGap.xxl(),
      ],
    );
  }
}
