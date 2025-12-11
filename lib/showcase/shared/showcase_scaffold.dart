import 'package:flutter/material.dart';
import 'package:foundry_ds/foundry_ds.dart';
import 'package:foundry_widget_book/theme_controller.dart';

class ShowcaseScaffold extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;

  const ShowcaseScaffold({super.key, required this.title, required this.children, this.padding});

  @override
  Widget build(BuildContext context) {
    final theme = FoundryTheme.of(context);
    final themeController = ThemeControllerProvider.of(context);

    return Scaffold(
      backgroundColor: theme.colors.bg.canvas,
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
                    padding: FInsets.symmetric(horizontal: FSpacing.lg, vertical: FSpacing.md),
                    child: Row(
                      children: [
                        if (Navigator.canPop(context))
                          FoundryButton.icon(
                            variant: FoundryButtonVariant.ghost,
                            tooltip: 'Back',
                            onPressed: () => Navigator.maybePop(context),
                            child: Icon(LucideIcons.arrowLeft, size: FIconSize.md, color: theme.colors.fg.primary),
                          ),
                        const Spacer(),
                        FoundryText.heading(title),
                        const Spacer(),
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
                              color: theme.colors.fg.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Content
                SliverPadding(
                  padding: padding ?? FInsets.all(FSpacing.lg),
                  sliver: SliverList(delegate: SliverChildListDelegate(children)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
