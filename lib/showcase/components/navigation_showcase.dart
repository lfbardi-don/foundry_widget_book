import 'package:flutter/material.dart';
import 'package:foundry_ds/foundry_ds.dart';
import '../shared/shared.dart';

class NavigationShowcase extends StatefulWidget {
  const NavigationShowcase({super.key});

  @override
  State<NavigationShowcase> createState() => _NavigationShowcaseState();
}

class _NavigationShowcaseState extends State<NavigationShowcase> {
  int _selectedTabIndex = 0;
  int _expandedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Navigation',
      children: [
        ComponentPreview(
          title: 'Basic Tabs',
          description: 'Tab bar for switching between views.',
          codeSnippet: '''
FoundryTabs(
  selectedIndex: _selectedIndex,
  onChanged: (index) => setState(() => _selectedIndex = index),
  tabs: const [
    FoundryTab(label: 'Overview'),
    FoundryTab(label: 'Details'),
    FoundryTab(label: 'Settings'),
  ],
)''',
          content: FoundryTabs(
            selectedIndex: _selectedTabIndex,
            onChanged: (index) => setState(() => _selectedTabIndex = index),
            tabs: const [
              FoundryTab(label: 'Overview'),
              FoundryTab(label: 'Details'),
              FoundryTab(label: 'Settings'),
            ],
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Tabs with Icons',
          description: 'Tabs can include icons for better visual association.',
          codeSnippet: '''
FoundryTabs(
  selectedIndex: _selectedIndex,
  onChanged: (index) => setState(() => _selectedIndex = index),
  tabs: const [
    FoundryTab(label: 'Home', icon: FIcons.home),
    FoundryTab(label: 'Search', icon: FIcons.search),
    FoundryTab(label: 'Profile', icon: FIcons.user),
  ],
)''',
          content: FoundryTabs(
            selectedIndex: _selectedTabIndex,
            onChanged: (index) => setState(() => _selectedTabIndex = index),
            tabs: const [
              FoundryTab(label: 'Home', icon: FIcons.home),
              FoundryTab(label: 'Search', icon: FIcons.search),
              FoundryTab(label: 'Profile', icon: FIcons.user),
            ],
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Tabs with Badges',
          description: 'Show notification counts on tabs.',
          codeSnippet: '''
FoundryTabs(
  selectedIndex: _selectedIndex,
  onChanged: (index) => setState(() => _selectedIndex = index),
  tabs: const [
    FoundryTab(label: 'Inbox', badge: 5),
    FoundryTab(label: 'Sent'),
    FoundryTab(label: 'Drafts', badge: 2),
  ],
)''',
          content: FoundryTabs(
            selectedIndex: _selectedTabIndex,
            onChanged: (index) => setState(() => _selectedTabIndex = index),
            tabs: const [
              FoundryTab(label: 'Inbox', badge: 5),
              FoundryTab(label: 'Sent'),
              FoundryTab(label: 'Drafts', badge: 2),
            ],
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Expanded Tabs',
          description: 'Tabs that fill the available width.',
          codeSnippet: '''
FoundryTabs(
  selectedIndex: _selectedIndex,
  onChanged: (index) => setState(() => _selectedIndex = index),
  isExpanded: true,
  tabs: const [
    FoundryTab(label: 'Tab 1'),
    FoundryTab(label: 'Tab 2'),
    FoundryTab(label: 'Tab 3'),
  ],
)''',
          content: FoundryTabs(
            selectedIndex: _expandedTabIndex,
            onChanged: (index) => setState(() => _expandedTabIndex = index),
            isExpanded: true,
            tabs: const [
              FoundryTab(label: 'Tab 1'),
              FoundryTab(label: 'Tab 2'),
              FoundryTab(label: 'Tab 3'),
            ],
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Disabled Tab',
          description: 'Tabs can be individually disabled.',
          codeSnippet: '''
FoundryTab(label: 'Disabled', isDisabled: true)''',
          content: FoundryTabs(
            selectedIndex: _selectedTabIndex,
            onChanged: (index) => setState(() => _selectedTabIndex = index),
            tabs: const [
              FoundryTab(label: 'Active'),
              FoundryTab(label: 'Also Active'),
              FoundryTab(label: 'Disabled', isDisabled: true),
            ],
          ),
        ),
        const FoundryGap.xxl(),
      ],
    );
  }
}
