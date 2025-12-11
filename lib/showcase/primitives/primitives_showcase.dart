import 'package:flutter/material.dart';
import 'package:foundry_ds/foundry_ds.dart';
import '../shared/shared.dart';

class PrimitivesShowcase extends StatelessWidget {
  const PrimitivesShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FoundryTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Primitives',
      children: [
        FoundryText.headingSmall('Stacks'),
        const FoundryGap.md(),
        ComponentPreview(
          title: 'VStack (Vertical Stack)',
          description: 'Automatically spaces children vertically with design tokens.',
          content: Container(
            padding: FInsets.md,
            decoration: BoxDecoration(color: colors.bg.muted, borderRadius: BorderRadius.circular(theme.radius.md)),
            child: const FoundryVStack.md(
              children: [FoundryText.body('Item 1'), FoundryText.body('Item 2'), FoundryText.body('Item 3')],
            ),
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'HStack (Horizontal Stack)',
          description: 'Automatically spaces children horizontally with design tokens.',
          content: Container(
            padding: FInsets.md,
            decoration: BoxDecoration(color: colors.bg.muted, borderRadius: BorderRadius.circular(theme.radius.md)),
            child: const FoundryHStack.md(
              children: [
                FoundryBadge.accent(label: 'Tag 1'),
                FoundryBadge.info(label: 'Tag 2'),
                FoundryBadge.positive(label: 'Tag 3'),
              ],
            ),
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Stack Spacing Sizes',
          description: 'Stacks come with preset spacing: xs, sm, md, lg, xl.',
          content: FoundryVStack.md(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FoundryText.caption('FoundryHStack.xs:'),
              Container(
                padding: FInsets.sm,
                decoration: BoxDecoration(color: colors.bg.muted, borderRadius: BorderRadius.circular(theme.radius.md)),
                child: const FoundryHStack.xs(
                  children: [FoundryText.body('A'), FoundryText.body('B'), FoundryText.body('C')],
                ),
              ),
              const FoundryText.caption('FoundryHStack.lg:'),
              Container(
                padding: FInsets.sm,
                decoration: BoxDecoration(color: colors.bg.muted, borderRadius: BorderRadius.circular(theme.radius.md)),
                child: const FoundryHStack.lg(
                  children: [FoundryText.body('A'), FoundryText.body('B'), FoundryText.body('C')],
                ),
              ),
            ],
          ),
        ),
        const FoundryGap.xxl(),
        FoundryText.headingSmall('Responsive'),
        const FoundryGap.md(),
        ComponentPreview(
          title: 'FoundryResponsive',
          description: 'Build adaptive layouts based on screen breakpoints.',
          content: FoundryResponsive(
            builder: (context, breakpoint) {
              final breakpointName = breakpoint.name.toUpperCase();
              return FoundryCard(
                child: FoundryVStack.sm(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FoundryHStack.xs(
                      children: [
                        FoundryText.body('Current breakpoint: ', weight: FontWeight.w600),
                        FoundryBadge.accent(label: breakpointName),
                      ],
                    ),
                    const FoundryText.caption(
                      'Resize the window to see the breakpoint change. '
                      'Available: SM, MD, LG, XL, XXL.',
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'FoundryResponsiveChild',
          description: 'Show different widgets based on screen size.',
          content: FoundryResponsiveChild(
            mobile: FoundryCard(
              child: FoundryHStack.sm(
                children: [
                  Icon(LucideIcons.smartphone, size: FIconSize.md, color: colors.fg.primary),
                  FoundryText.body('Mobile Layout'),
                ],
              ),
            ),
            tablet: FoundryCard(
              child: FoundryHStack.sm(
                children: [
                  Icon(LucideIcons.tablet, size: FIconSize.md, color: colors.fg.primary),
                  FoundryText.body('Tablet Layout'),
                ],
              ),
            ),
            desktop: FoundryCard(
              child: FoundryHStack.sm(
                children: [
                  Icon(LucideIcons.monitor, size: FIconSize.md, color: colors.fg.primary),
                  FoundryText.body('Desktop Layout'),
                ],
              ),
            ),
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Helper Methods',
          description: 'Quick checks for screen size categories.',
          content: Builder(
            builder: (context) {
              final isMobile = FoundryResponsive.isMobile(context);
              final isTablet = FoundryResponsive.isTablet(context);
              final isDesktop = FoundryResponsive.isDesktop(context);

              return FoundryHStack.md(
                children: [
                  FoundryBadge(
                    label: 'Mobile',
                    variant: isMobile ? FoundryBadgeVariant.positive : FoundryBadgeVariant.neutral,
                  ),
                  FoundryBadge(
                    label: 'Tablet',
                    variant: isTablet ? FoundryBadgeVariant.positive : FoundryBadgeVariant.neutral,
                  ),
                  FoundryBadge(
                    label: 'Desktop',
                    variant: isDesktop ? FoundryBadgeVariant.positive : FoundryBadgeVariant.neutral,
                  ),
                ],
              );
            },
          ),
        ),
        const FoundryGap.xxl(),
      ],
    );
  }
}
