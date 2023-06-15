import 'package:flutter/material.dart';
import 'package:shared_preferences_app/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.settingsPage);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
