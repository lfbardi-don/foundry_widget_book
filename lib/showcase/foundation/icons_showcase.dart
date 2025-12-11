import 'package:flutter/material.dart';
import 'package:foundry_ds/foundry_ds.dart';
import '../shared/shared.dart';

class IconsShowcase extends StatelessWidget {
  const IconsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    // List of representative icons from FIcons
    final icons = [
      _IconItem('close', FIcons.close),
      _IconItem('arrowLeft', FIcons.arrowLeft),
      _IconItem('arrowRight', FIcons.arrowRight),
      _IconItem('chevronDown', FIcons.chevronDown),
      _IconItem('chevronUp', FIcons.chevronUp),
      _IconItem('menu', FIcons.menu),
      _IconItem('moreH', FIcons.moreHorizontal),
      _IconItem('moreV', FIcons.moreVertical),
      _IconItem('checkCircle', FIcons.checkCircle),
      _IconItem('check', FIcons.check),
      _IconItem('info', FIcons.info),
      _IconItem('alertTriangle', FIcons.alertTriangle),
      _IconItem('alertCircle', FIcons.alertCircle),
      _IconItem('user', FIcons.user),
      _IconItem('users', FIcons.users),
      _IconItem('plus', FIcons.plus),
      _IconItem('trash', FIcons.trash),
      _IconItem('edit', FIcons.edit),
      _IconItem('search', FIcons.search),
      _IconItem('settings', FIcons.settings),
      _IconItem('share', FIcons.share),
      _IconItem('download', FIcons.download),
    ];

    return ShowcaseScaffold(
      title: 'Icons',
      children: [
        ComponentPreview(
          title: 'Semantic Icons',
          description: 'Icons mapping to semantic actions and objects.',
          content: GridView.count(
            crossAxisCount: 6, // Increased for desktop/web
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: FSpacing.lg,
            crossAxisSpacing: FSpacing.lg,
            children: icons,
          ),
        ),
      ],
    );
  }
}

class _IconItem extends StatelessWidget {
  final String name;
  final IconData icon;

  const _IconItem(this.name, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FoundryIcon(icon, size: FoundryIconSize.lg),
        const FoundryGap.xs(),
        FoundryText.caption(name, textAlign: TextAlign.center),
      ],
    );
  }
}
