import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String currentlanguage = 'en';

  void changelanguage(String language) {
    currentlanguage = language;
    notifyListeners();
  }
}
