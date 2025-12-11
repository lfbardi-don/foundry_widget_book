import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foundry_ds/foundry_ds.dart';
import '../shared/shared.dart';

class ButtonsShowcase extends StatefulWidget {
  const ButtonsShowcase({super.key});

  @override
  State<ButtonsShowcase> createState() => _ButtonsShowcaseState();
}

class _ButtonsShowcaseState extends State<ButtonsShowcase> {
  bool _isLoading = false;
  Timer? _timer;

  void _simulateLoading() {
    setState(() {
      _isLoading = true;
    });

    // Cancel any existing timer
    _timer?.cancel();

    // Show loading for 2 seconds, then hide
    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Buttons',
      children: [
        ComponentPreview(
          title: 'Primary',
          description: 'Main call-to-action button, used for the most important action on a screen.',
          codeSnippet: '''
            FoundryButton(
              onPressed: () {},
              child: const FoundryText.body('Primary Button'),
            ),
            FoundryButton(
              onPressed: () {},
              prefixIcon: const Icon(FIcons.check),
              variant: FoundryButtonVariant.primary,
              child: const FoundryText.body('Primary Icon'),
            ),''',
          content: Wrap(
            spacing: FSpacing.md,
            children: [
              FoundryButton(onPressed: () {}, child: const FoundryText.inherit('Primary Button')),
              FoundryButton(
                onPressed: () {},
                prefixIcon: const Icon(FIcons.check),
                variant: FoundryButtonVariant.primary,
                child: const FoundryText.inherit('Primary Icon'),
              ),
            ],
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Secondary',
          description: 'Alternative action, often used in conjunction with a primary button.',
          content: Wrap(
            spacing: FSpacing.md,
            children: [
              FoundryButton(
                onPressed: () {},
                variant: FoundryButtonVariant.secondary,
                child: const FoundryText.inherit('Secondary Button'),
              ),
              FoundryButton(
                onPressed: () {},
                prefixIcon: const Icon(FIcons.settings),
                variant: FoundryButtonVariant.secondary,
                child: const FoundryText.inherit('Secondary Icon'),
              ),
            ],
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Outline',
          description: 'Low-emphasis button with a border.',
          content: FoundryButton(
            onPressed: () {},
            variant: FoundryButtonVariant.outline,
            child: const FoundryText.inherit('Outline Button'),
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Ghost',
          description: 'Text-only button for subtle actions.',
          content: Wrap(
            spacing: FSpacing.md,
            children: [
              FoundryButton(
                onPressed: () {},
                variant: FoundryButtonVariant.ghost,
                child: const FoundryText.inherit('Ghost Button'),
              ),
              FoundryButton(
                onPressed: () {},
                suffixIcon: const Icon(FIcons.arrowRight),
                variant: FoundryButtonVariant.ghost,
                child: const FoundryText.inherit('Ghost Icon'),
              ),
            ],
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Destructive',
          description: 'Indicates a dangerous action like deletion.',
          content: FoundryButton(
            onPressed: () {},
            variant: FoundryButtonVariant.destructive,
            child: const FoundryText.inherit('Destructive Button'),
          ),
        ),
        const FoundryGap.xxl(),
        FoundryText.headingSmall('Sizes'),
        const FoundryGap.md(),
        ComponentPreview(
          title: 'Button Sizes',
          content: Wrap(
            spacing: FSpacing.md,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              FoundryButton(onPressed: () {}, size: FoundryButtonSize.small, child: const FoundryText.inherit('Small')),
              FoundryButton(
                onPressed: () {},
                size: FoundryButtonSize.medium,
                child: const FoundryText.inherit('Medium'),
              ),
              FoundryButton(onPressed: () {}, size: FoundryButtonSize.large, child: const FoundryText.inherit('Large')),
              FoundryButton.icon(
                onPressed: () {},
                size: FoundryButtonSize.small,
                tooltip: 'Small',
                child: const Icon(FIcons.check),
              ),
              FoundryButton.icon(
                onPressed: () {},
                size: FoundryButtonSize.medium,
                tooltip: 'Medium',
                child: const Icon(FIcons.check),
              ),
              FoundryButton.icon(
                onPressed: () {},
                size: FoundryButtonSize.large,
                tooltip: 'Large',
                child: const Icon(FIcons.check),
              ),
            ],
          ),
        ),
        const FoundryGap.xxl(),
        FoundryText.headingSmall('Icon-Only Buttons'),
        const FoundryGap.md(),
        ComponentPreview(
          title: 'Icon-Only Variants',
          description: 'Buttons with only icons, no labels.',
          content: Wrap(
            spacing: FSpacing.md,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              FoundryButton.icon(
                onPressed: () {},
                variant: FoundryButtonVariant.primary,
                tooltip: 'Check',
                child: const Icon(FIcons.check),
              ),
              FoundryButton.icon(
                onPressed: () {},
                variant: FoundryButtonVariant.secondary,
                tooltip: 'Settings',
                child: const Icon(FIcons.settings),
              ),
              FoundryButton.icon(
                onPressed: () {},
                variant: FoundryButtonVariant.outline,
                tooltip: 'Arrow',
                child: const Icon(FIcons.arrowRight),
              ),
              FoundryButton.icon(
                onPressed: () {},
                variant: FoundryButtonVariant.ghost,
                tooltip: 'Check',
                child: const Icon(FIcons.check),
              ),
            ],
          ),
        ),
        const FoundryGap.xxl(),
        FoundryText.headingSmall('States'),
        const FoundryGap.md(),
        ComponentPreview(
          title: 'Loading States',
          description: 'Click any button to see the loading animation in action.',
          content: Wrap(
            spacing: FSpacing.md,
            runSpacing: FSpacing.md,
            children: [
              FoundryButton(
                onPressed: _simulateLoading,
                isLoading: _isLoading,
                enableHaptics: true,
                tooltip: 'Loading',
                variant: FoundryButtonVariant.primary,
                size: FoundryButtonSize.medium,
                prefixIcon: const Icon(FIcons.check),
                child: const FoundryText.inherit('Click to Load'),
              ),
            ],
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Disabled State',
          description: 'Buttons that are not interactive.',
          content: Wrap(
            spacing: FSpacing.md,
            children: [
              FoundryButton(onPressed: () {}, isDisabled: true, child: const FoundryText.body('Disabled Primary')),
              FoundryButton.icon(
                onPressed: () {},
                variant: FoundryButtonVariant.secondary,
                isDisabled: true,
                tooltip: 'Disabled Settings',
                child: const Icon(FIcons.settings),
              ),
            ],
          ),
        ),
        const FoundryGap.xxl(),
      ],
    );
  }
}
