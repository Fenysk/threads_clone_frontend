import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  bool _isDarkModeOn = false;

  bool get isDarkModeOn => _isDarkModeOn;

  void toggleTheme() {
    _isDarkModeOn = !_isDarkModeOn;
    notifyListeners();
  }
}
