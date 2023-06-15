import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  String _thememode = "Light";

  String get thememode => _thememode;

  set thememode(String newMode) {
    _thememode = newMode;
    print("New Theme = $_thememode");
    notifyListeners();
  }
}
