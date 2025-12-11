import 'package:flutter/material.dart';
import 'package:foundry_ds/foundry_ds.dart';
import '../shared/shared.dart';

class DataDisplayShowcase extends StatelessWidget {
  const DataDisplayShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Data Display',
      children: [
        ComponentPreview(
          title: 'Avatars',
          description: 'User profile images in various sizes.',
          content: Wrap(
            spacing: FSpacing.md,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: const [
              FoundryAvatar.xl(initials: 'XL'),
              FoundryAvatar.lg(initials: 'LG'),
              FoundryAvatar.md(initials: 'MD', showStatus: true, isOnline: true),
              FoundryAvatar.sm(initials: 'SM'),
              FoundryAvatar.xs(initials: 'XS'),
            ],
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Progress',
          description: 'Indicators for task completion.',
          content: FoundryVStack.md(
            children: const [
              FoundryProgress.linear(value: 0.3),
              FoundryProgress.linear(value: 0.7, trackColor: Colors.black12, progressColor: Colors.purple),
              FoundryProgress.linear(), // indeterminate
              FoundryGap.sm(),
              FoundryHStack.lg(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [FoundryProgress.circular(), FoundryProgress.circular(value: 0.6)],
              ),
            ],
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Dividers',
          description: 'Separators for content grouping.',
          content: FoundryVStack.sm(
            children: const [
              FoundryText.body('Item 1'),
              FoundryDivider(),
              FoundryText.body('Item 2'),
            ],
          ),
        ),
        const FoundryGap.xxl(),
      ],
    );
  }
}
