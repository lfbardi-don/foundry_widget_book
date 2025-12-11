import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foundry_ds/foundry_ds.dart';
import 'package:foundry_widget_book/main.dart';
import 'package:foundry_widget_book/theme_controller.dart';

void main() {
  group('ThemeController', () {
    test('starts in light mode', () {
      final controller = ThemeController();
      expect(controller.isDarkMode, isFalse);
    });

    test('toggleTheme switches modes', () {
      final controller = ThemeController();

      controller.toggleTheme();
      expect(controller.isDarkMode, isTrue);

      controller.toggleTheme();
      expect(controller.isDarkMode, isFalse);
    });

    test('setDarkMode explicitly sets mode', () {
      final controller = ThemeController();

      controller.setDarkMode(true);
      expect(controller.isDarkMode, isTrue);

      controller.setDarkMode(false);
      expect(controller.isDarkMode, isFalse);
    });

    test('returns correct theme data', () {
      final controller = ThemeController();

      expect(controller.theme, isA<FoundryLightTheme>());

      controller.toggleTheme();
      expect(controller.theme, isA<FoundryDarkTheme>());
    });
  });

  group('App Smoke Test', () {
    testWidgets('FoundryWidgetBook creates MaterialApp', (tester) async {
      await tester.pumpWidget(const FoundryWidgetBook());
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
