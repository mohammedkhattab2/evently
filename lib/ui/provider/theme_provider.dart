import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  changeMood(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }
}
