import 'package:flutter/material.dart';
import 'package:foundry_ds/foundry_ds.dart';
import '../shared/shared.dart';

class ContainersShowcase extends StatelessWidget {
  const ContainersShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Containers',
      children: [
        const ComponentPreview(
          title: 'Card Variants',
          description: 'Cards are containers for grouping related content.',
          content: FoundryVStack.md(
            children: [
              FoundryCard(
                variant: FoundryCardVariant.elevated,
                child: FoundryVStack.sm(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FoundryText.headingSmall('Elevated Card'),
                    FoundryText.body('Default card with shadow for depth.'),
                  ],
                ),
              ),
              FoundryCard(
                variant: FoundryCardVariant.outlined,
                child: FoundryVStack.sm(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FoundryText.headingSmall('Outlined Card'),
                    FoundryText.body('Card with border, no shadow.'),
                  ],
                ),
              ),
              FoundryCard(
                variant: FoundryCardVariant.flat,
                child: FoundryVStack.sm(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FoundryText.headingSmall('Flat Card'),
                    FoundryText.body('Subtle background, no border or shadow.'),
                  ],
                ),
              ),
            ],
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Card with Custom Padding',
          description: 'Cards support custom padding for different content needs.',
          content: FoundryCard(
            padding: FInsets.lg,
            child: FoundryHStack.md(
              children: [
                const FoundryAvatar.md(initials: 'JD'),
                Expanded(
                  child: FoundryVStack.xs(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      FoundryText.body('John Doe', weight: FontWeight.w600),
                      FoundryText.caption('Software Engineer'),
                    ],
                  ),
                ),
                FoundryButton.icon(
                  onPressed: () {},
                  variant: FoundryButtonVariant.ghost,
                  tooltip: 'More options',
                  child: const Icon(FIcons.moreVertical),
                ),
              ],
            ),
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'FoundryPage',
          description:
              'Page wrapper that centers content with max-width constraints. The Widget Book itself uses this pattern.',
          content: FoundryCard(
            child: FoundryVStack.md(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                FoundryText.body(
                  'FoundryPage wraps a Scaffold and constrains the body content to a maximum width (FLayout.xl by default), '
                  'automatically centering it on larger screens.',
                ),
                FoundryText.caption('Usage: FoundryPage(body: YourContent(), appBar: ...)'),
              ],
            ),
          ),
        ),
        const FoundryGap.xxl(),
      ],
    );
  }
}
