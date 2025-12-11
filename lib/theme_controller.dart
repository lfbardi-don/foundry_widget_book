import 'package:flutter/widgets.dart';
import 'package:foundry_ds/foundry_ds.dart';

/// A controller for managing the app's theme state.
class ThemeController extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  FoundryThemeData get theme => _isDarkMode ? FoundryDarkTheme() : FoundryLightTheme();

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void setDarkMode(bool value) {
    if (_isDarkMode != value) {
      _isDarkMode = value;
      notifyListeners();
    }
  }
}

/// InheritedNotifier that provides the ThemeController to the widget tree.
class ThemeControllerProvider extends InheritedNotifier<ThemeController> {
  const ThemeControllerProvider({super.key, required ThemeController controller, required super.child})
    : super(notifier: controller);

  static ThemeController of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<ThemeControllerProvider>();
    assert(provider != null, 'No ThemeControllerProvider found in context');
    return provider!.notifier!;
  }
}
