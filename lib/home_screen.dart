import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:foundry_ds/foundry_ds.dart';

import 'theme_controller.dart';
import 'showcase/foundation/colors_showcase.dart';
import 'showcase/foundation/typography_showcase.dart';
import 'showcase/foundation/icons_showcase.dart';
import 'showcase/components/buttons_showcase.dart';
import 'showcase/components/inputs_showcase.dart';
import 'showcase/components/selection_controls_showcase.dart';
import 'showcase/components/feedback_showcase.dart';
import 'showcase/components/data_display_showcase.dart';
import 'showcase/components/navigation_showcase.dart';
import 'showcase/components/containers_showcase.dart';
import 'showcase/patterns/layout_showcase.dart';
import 'showcase/patterns/misc_showcase.dart';
import 'showcase/primitives/primitives_showcase.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static void _launchGitHub() {
    launchUrl(Uri.parse('https://github.com/lfbardi-don'));
  }

  static const List<_SectionData> _allSections = [
    _SectionData('Foundation', [
      _GridItem('Colors', 'Palette & System', LucideIcons.palette, 'ColorsShowcase'),
      _GridItem('Typography', 'Text Styles & Fonts', LucideIcons.type, 'TypographyShowcase'),
      _GridItem('Icons', 'System Icons', LucideIcons.grid3x3, 'IconsShowcase'),
    ]),
    _SectionData('Components', [
      _GridItem('Buttons', 'Actions & Triggers', LucideIcons.mousePointerClick, 'ButtonsShowcase'),
      _GridItem('Inputs', 'Text, Select Fields', LucideIcons.textCursorInput, 'InputsShowcase'),
      _GridItem('Selection', 'Checkbox, Radio, Switch', LucideIcons.squareCheck, 'SelectionControlsShowcase'),
      _GridItem('Feedback', 'Alerts, Toast, Badge', LucideIcons.bell, 'FeedbackShowcase'),
      _GridItem('Data Display', 'Avatar, Progress', LucideIcons.chartPie, 'DataDisplayShowcase'),
      _GridItem('Navigation', 'Tabs & TabView', LucideIcons.panelTop, 'NavigationShowcase'),
      _GridItem('Containers', 'Card & Page', LucideIcons.square, 'ContainersShowcase'),
    ]),
    _SectionData('Patterns & Primitives', [
      _GridItem('Layout', 'Surface, Gap, Forms', LucideIcons.layers, 'LayoutShowcase'),
      _GridItem('Stacks & Responsive', 'VStack, HStack, Breakpoints', LucideIcons.columns3, 'PrimitivesShowcase'),
      _GridItem('Misc', 'Modals, Sheets, Tooltip', LucideIcons.messageSquare, 'MiscShowcase'),
    ]),
  ];

  Widget _getDestination(String key) {
    switch (key) {
      case 'ColorsShowcase':
        return const ColorsShowcase();
      case 'TypographyShowcase':
        return const TypographyShowcase();
      case 'IconsShowcase':
        return const IconsShowcase();
      case 'ButtonsShowcase':
        return const ButtonsShowcase();
      case 'InputsShowcase':
        return const InputsShowcase();
      case 'SelectionControlsShowcase':
        return const SelectionControlsShowcase();
      case 'FeedbackShowcase':
        return const FeedbackShowcase();
      case 'DataDisplayShowcase':
        return const DataDisplayShowcase();
      case 'NavigationShowcase':
        return const NavigationShowcase();
      case 'ContainersShowcase':
        return const ContainersShowcase();
      case 'LayoutShowcase':
        return const LayoutShowcase();
      case 'PrimitivesShowcase':
        return const PrimitivesShowcase();
      case 'MiscShowcase':
        return const MiscShowcase();
      default:
        return const Scaffold(body: Center(child: FoundryText.body('Not Found')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = FoundryTheme.of(context);
    final colors = theme.colors;
    final themeController = ThemeControllerProvider.of(context);

    return Scaffold(
      backgroundColor: colors.bg.canvas,
      body: FoundrySmoothScroll(
        smoothness: 0.05,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: FLayout.lg),
            child: CustomScrollView(
              primary: true,
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: FInsets.symmetric(horizontal: FSpacing.lg, vertical: FSpacing.xxl),
                    child: FoundryVStack.lg(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FoundryGap.xl(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: FoundryVStack.sm(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      FoundryText.displayLarge(
                                        'Foundry Design System',
                                        weight: FontWeight.w800,
                                      ),
                                      const FoundryGap.md(),
                                      FoundryBadge.accent(label: 'v1.0.0'),
                                    ],
                                  ),
                                  const FoundryGap.sm(),
                                  FoundryText.body(
                                    'A comprehensive design system for Flutter applications.',
                                    color: colors.fg.secondary,
                                  ),
                                  FoundryInteractive(
                                    onTap: _launchGitHub,
                                    builder: (isHovered, isFocused, isPressed) {
                                      return Text(
                                        'By github.com/lfbardi-don',
                                        style: TextStyle(
                                          fontSize: FTypography.bodySmall,
                                          color: isHovered ? colors.accent.hover : colors.accent.base,
                                          decoration: isHovered ? TextDecoration.underline : TextDecoration.none,
                                          decorationColor: colors.accent.hover,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            // Theme toggle button
                            FoundryButton.icon(
                              onPressed: themeController.toggleTheme,
                              variant: FoundryButtonVariant.ghost,
                              tooltip: themeController.isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                              child: AnimatedSwitcher(
                                duration: theme.motion.fast,
                                transitionBuilder: (child, animation) => RotationTransition(
                                  turns: Tween(begin: 0.5, end: 1.0).animate(animation),
                                  child: FadeTransition(opacity: animation, child: child),
                                ),
                                child: Icon(
                                  themeController.isDarkMode ? LucideIcons.sun : LucideIcons.moon,
                                  key: ValueKey(themeController.isDarkMode),
                                  color: colors.fg.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const FoundryGap.lg(),
                        // Accent divider
                        FoundryDivider(color: colors.accent.base, thickness: FBorderWidth.medium),
                      ],
                    ),
                  ),
                ),
                // Sections grid
                SliverPadding(
                  padding: FInsets.all(FSpacing.lg),
                  sliver: SliverToBoxAdapter(
                    child: FoundryVStack.xl(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _allSections.map((section) => _buildSection(context, section)).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, _SectionData section) {
    return FoundryVStack.md(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: FInsets.only(left: FSpacing.xs),
          child: FoundryText.headingSmall(section.title),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth > 800 ? 4 : (constraints.maxWidth > 500 ? 3 : 2);
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: FSpacing.md,
                mainAxisSpacing: FSpacing.md,
                childAspectRatio: 1.1,
              ),
              itemCount: section.items.length,
              itemBuilder: (context, index) => _NavTile(
                item: section.items[index],
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => _getDestination(section.items[index].destinationKey)),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _SectionData {
  final String title;
  final List<_GridItem> items;

  const _SectionData(this.title, this.items);
}

class _GridItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final String destinationKey;

  const _GridItem(this.title, this.subtitle, this.icon, this.destinationKey);
}

class _NavTile extends StatelessWidget {
  final _GridItem item;
  final VoidCallback onTap;

  const _NavTile({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = FoundryTheme.of(context);
    final colors = theme.colors;
    final motion = theme.motion;

    return FoundryInteractive(
      onTap: onTap,
      builder: (isHovered, isFocused, isPressed) {
        final bgColor = isPressed
            ? colors.state.active.bg!
            : isHovered
            ? colors.state.hover.bg!
            : colors.bg.canvas;

        return AnimatedScale(
          scale: isPressed ? 0.96 : 1.0,
          duration: motion.fast,
          child: AnimatedContainer(
            duration: motion.fast,
            curve: motion.easeInOut,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(theme.radius.lg),
              border: Border.all(
                color: isFocused ? colors.border.focus : colors.border.muted,
                width: isFocused ? FBorderWidth.medium : FBorderWidth.hairline,
              ),
            ),
            child: Padding(
              padding: FInsets.md,
              child: FoundryVStack.sm(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item.icon, size: FIconSize.lg, color: colors.fg.primary),
                  const FoundryGap.sm(),
                  FoundryText.body(item.title, weight: FontWeight.w600, textAlign: TextAlign.center),
                  FoundryText.caption(
                    item.subtitle,
                    color: colors.fg.secondary,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
