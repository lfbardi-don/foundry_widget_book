import 'package:flutter/material.dart';
import 'package:foundry_ds/foundry_ds.dart';
import '../shared/shared.dart';

class TypographyShowcase extends StatelessWidget {
  const TypographyShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Typography',
      children: const [
        ComponentPreview(
          title: 'Display',
          description: 'Large, impactful text for hero sections and major headings.',
          codeSnippet: '''
FoundryText.displayLarge('The quick brown fox')
FoundryText.display('The quick brown fox')''',
          content: FoundryVStack.md(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TypeItem('Display Large', FoundryText.displayLarge('The quick brown fox')),
              _TypeItem('Display', FoundryText.display('The quick brown fox')),
            ],
          ),
        ),
        FoundryGap.xl(),
        ComponentPreview(
          title: 'Headings',
          description: 'Section headers with varying emphasis levels.',
          codeSnippet: '''
FoundryText.headingLarge('The quick brown fox')
FoundryText.heading('The quick brown fox')
FoundryText.headingSmall('The quick brown fox')
FoundryText.subheading('The quick brown fox')''',
          content: FoundryVStack.md(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TypeItem('Heading Large', FoundryText.headingLarge('The quick brown fox')),
              _TypeItem('Heading', FoundryText.heading('The quick brown fox')),
              _TypeItem('Heading Small', FoundryText.headingSmall('The quick brown fox')),
              _TypeItem('Subheading', FoundryText.subheading('The quick brown fox')),
            ],
          ),
        ),
        FoundryGap.xl(),
        ComponentPreview(
          title: 'Body & Caption',
          description: 'Standard readable text for content and annotations.',
          codeSnippet: '''
FoundryText.body('Body text content')
FoundryText.bodySmall('Smaller body text')
FoundryText.caption('Auxiliary information')''',
          content: FoundryVStack.md(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TypeItem('Body', FoundryText.body('The quick brown fox jumps over the lazy dog.')),
              _TypeItem(
                'Body Small',
                FoundryText.bodySmall('The quick brown fox jumps over the lazy dog.'),
              ),
              _TypeItem('Caption', FoundryText.caption('The quick brown fox jumps over the lazy dog.')),
            ],
          ),
        ),
        FoundryGap.xxl(),
      ],
    );
  }
}

class _TypeItem extends StatelessWidget {
  final String label;
  final Widget textWidget;

  const _TypeItem(this.label, this.textWidget);

  @override
  Widget build(BuildContext context) {
    final colors = FoundryTheme.of(context).colors;
    return FoundryVStack.xs(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FoundryText.caption(label, color: colors.fg.muted),
        textWidget,
      ],
    );
  }
}
