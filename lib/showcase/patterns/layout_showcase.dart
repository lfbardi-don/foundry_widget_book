import 'package:flutter/material.dart';
import 'package:foundry_ds/foundry_ds.dart';
import '../shared/shared.dart';

class LayoutShowcase extends StatelessWidget {
  const LayoutShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Layout',
      children: [
        ComponentPreview(
          title: 'Surfaces',
          description: 'Containers with varying elevation levels.',
          content: FoundryVStack.md(
            children: const [
              FoundrySurface.flat(
                child: SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Center(child: FoundryText.body('Flat Surface')),
                ),
              ),
              FoundrySurface.raised(
                child: SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Center(child: FoundryText.body('Raised Surface (Default)')),
                ),
              ),
              FoundrySurface.elevated(
                child: SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Center(child: FoundryText.body('Elevated Surface')),
                ),
              ),
            ],
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Gap (Spacing)',
          description: 'Standardized spacing tokens between items.',
          content: FoundrySurface.flat(
            child: Padding(
              padding: FInsets.all(FSpacing.md),
              child: FoundryHStack.xs(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  FoundryText.body('Item'),
                  FoundryText.caption('xs'),
                  FoundryGap.xs(),
                  FoundryText.caption('sm'),
                  FoundryGap.sm(),
                  FoundryText.caption('md'),
                  FoundryGap.md(),
                  FoundryText.caption('lg'),
                ],
              ),
            ),
          ),
        ),
        const FoundryGap.xxl(),
        FoundryText.headingSmall('Patterns'),
        const FoundryGap.md(),
        ComponentPreview(
          title: 'Empty State',
          description: 'Consistent UI for when there is no data to display.',
          content: FoundryCard(
            child: FoundryEmptyState(
              icon: FIcons.mail,
              title: 'No messages',
              description: 'Your inbox is empty. Messages will appear here.',
              action: FoundryButton(
                onPressed: () {},
                size: FoundryButtonSize.medium,
                child: const FoundryText.inherit('Compose'),
              ),
            ),
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Empty State (Simple)',
          description: 'Minimal empty state without action button.',
          content: FoundryCard(
            child: FoundryEmptyState(
              icon: FIcons.search,
              title: 'No results found',
              description: 'Try adjusting your search criteria.',
            ),
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Form Section',
          description: 'Group form fields with consistent spacing and optional headers.',
          content: FoundryCard(
            child: FoundryFormSection(
              title: 'Personal Information',
              description: 'Enter your details below.',
              children: const [
                FoundryInput(label: 'First Name', placeholder: 'John'),
                FoundryInput(label: 'Last Name', placeholder: 'Doe'),
                FoundryInput(label: 'Email', placeholder: 'john@example.com'),
              ],
            ),
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Form Section (Title Only)',
          description: 'Form section with just a title, no description.',
          content: FoundryCard(
            child: FoundryFormSection(
              title: 'Address',
              children: const [
                FoundryInput(label: 'Street', placeholder: '123 Main St'),
                FoundryInput(label: 'City', placeholder: 'New York'),
              ],
            ),
          ),
        ),
        const FoundryGap.xxl(),
      ],
    );
  }
}
