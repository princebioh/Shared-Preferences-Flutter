import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    loadThemePrefs();
  }
  String _thememode = "Light";
  String get thememode => _thememode;

  SharedPreferences? prefs;

// initialize Shared Preferences
  Future<void> initializePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

// Load Saved Theme Data
  loadThemePrefs() async {
    await initializePrefs();
    _thememode = prefs?.getString("themeData") ?? "light";
    notifyListeners();
  }

// Set Saved Theme Data
  setThemePrefs() async {
    await initializePrefs();
    prefs?.setString("themeData", _thememode);
  }

  set thememode(String newMode) {
    _thememode = newMode;
    setThemePrefs();
    notifyListeners();
  }
}
