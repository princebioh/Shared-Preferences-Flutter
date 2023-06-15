import 'package:flutter/material.dart';

import '../pages/homepage.dart';
import '../pages/settings_page.dart';

class Routes {
  static const String homePage = "/";
  static const String settingsPage = "/settings";

  static Route<dynamic> routeManager(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case settingsPage:
        return MaterialPageRoute(
          builder: (context) => const SettingsPage(),
        );
      default:
        throw const FormatException("Page Not Found");
    }
  }
}
