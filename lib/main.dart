import 'package:flutter/material.dart';
import 'package:foundry_ds/foundry_ds.dart';
import 'package:foundry_widget_book/home_screen.dart';
import 'package:foundry_widget_book/theme_controller.dart';

void main() {
  runApp(const FoundryWidgetBook());
}

class FoundryWidgetBook extends StatefulWidget {
  const FoundryWidgetBook({super.key});

  @override
  State<FoundryWidgetBook> createState() => _FoundryWidgetBookState();
}

class _FoundryWidgetBookState extends State<FoundryWidgetBook> {
  final _themeController = ThemeController();

  @override
  void dispose() {
    _themeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeControllerProvider(
      controller: _themeController,
      child: ListenableBuilder(
        listenable: _themeController,
        builder: (context, _) {
          return FoundryTheme(
            data: _themeController.theme,
            child: MaterialApp(debugShowCheckedModeBanner: false, home: const HomeScreen()),
          );
        },
      ),
    );
  }
}
