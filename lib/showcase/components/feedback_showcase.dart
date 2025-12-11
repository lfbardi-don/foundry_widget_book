import 'package:flutter/material.dart';
import 'package:foundry_ds/foundry_ds.dart';
import '../shared/shared.dart';

class FeedbackShowcase extends StatelessWidget {
  const FeedbackShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Feedback',
      children: [
        ComponentPreview(
          title: 'Alerts',
          description: 'Inline notifications to communicate states.',
          content: FoundryVStack.md(
            children: [
              const FoundryAlert.info(description: 'This is an info alert'),
              const FoundryAlert.positive(description: 'Action completed successfully'),
              const FoundryAlert.warning(title: 'Warning', description: 'Please check your inputs'),
              FoundryAlert.negative(title: 'Error', description: 'Something went wrong', onDismiss: _noop),
            ],
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Badges',
          description: 'Small status indicators for items.',
          content: Wrap(
            spacing: FSpacing.md,
            runSpacing: FSpacing.md,
            children: const [
              FoundryBadge.neutral(label: 'Neutral'),
              FoundryBadge.positive(label: 'Success'),
              FoundryBadge.negative(label: 'Error'),
              FoundryBadge.warning(label: 'Warning'),
              FoundryBadge.info(label: 'Info'),
              FoundryBadge.accent(label: 'Accent'),
              FoundryBadge.accent(count: 5),
              FoundryBadge.negative(count: 999),
            ],
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Toasts',
          description: 'Transient notifications matching system status.',
          content: Wrap(
            spacing: FSpacing.md,
            children: [
              FoundryButton(
                onPressed: () => FoundryToast.show(
                  context: context,
                  message: 'Message sent successfully',
                  variant: FoundryToastVariant.positive,
                ),
                child: const FoundryText.inherit('Success Toast'),
              ),
              FoundryButton(
                onPressed: () => FoundryToast.show(
                  context: context,
                  message: 'Connection lost',
                  variant: FoundryToastVariant.negative,
                ),
                variant: FoundryButtonVariant.destructive,
                child: const FoundryText.inherit('Error Toast'),
              ),
            ],
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Snackbars',
          description: 'Bottom notifications often with actions.',
          content: Wrap(
            spacing: FSpacing.md,
            children: [
              FoundryButton(
                onPressed: () => FoundrySnackbar.show(
                  context: context,
                  message: 'Item deleted',
                  actionLabel: 'Undo',
                  onAction: () {},
                ),
                child: const FoundryText.inherit('Show Snackbar'),
              ),
            ],
          ),
        ),
        const FoundryGap.xxl(),
      ],
    );
  }

  static void _noop() {}
}
