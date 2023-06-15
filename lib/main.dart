import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences_app/providers/theme_provider.dart';
import 'package:shared_preferences_app/routes/routes.dart';
import 'package:shared_preferences_app/themes/themes.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      builder: (context, child) {
        String userTheme = context.watch<ThemeProvider>().thememode;
        return MaterialApp(
          theme: userTheme == "Dark" ? darkTheme : lightTheme,
          initialRoute: Routes.homePage,
          onGenerateRoute: Routes.routeManager,
        );
      },
    );
  }
}
