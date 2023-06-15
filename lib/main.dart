import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences_app/providers/theme_provider.dart';
import 'package:shared_preferences_app/routes/routes.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => ThemeProvider()),
      ],
      builder: (context, child) {
        return const MaterialApp(
          initialRoute: Routes.homePage,
          onGenerateRoute: Routes.routeManager,
        );
      },
    );
  }
}
