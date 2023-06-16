import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences_app/providers/theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<String> radioOptions = ["Light", "Dark"];
  String? radioGroupValue = "Light";
  String chosenTheme = "";

  @override
  Widget build(BuildContext context) {
    showTheDialog() {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            title: const Text("Choose Theme"),
            content: SingleChildScrollView(
              child: Column(children: [
                RadioListTile(
                  title: const Text("Light"),
                  value: radioOptions[0],
                  groupValue: radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      radioGroupValue = value;
                      context.read<ThemeProvider>().thememode = value!;
                      Navigator.pop(context);
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Dark"),
                  value: radioOptions[1],
                  groupValue: radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      radioGroupValue = value;
                      context.read<ThemeProvider>().thememode = value!;
                      Navigator.pop(context);
                    });
                  },
                ),
              ]),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings Page"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Consumer<ThemeProvider>(
            builder: (context, value, child) {
              return ListTile(
                leading: const Icon(Icons.brightness_6),
                title: const Text("Theme"),
                subtitle: Text(value.thememode),
                onTap: showTheDialog,
              );
            },
          ),
        ],
      ),
    );
  }
}
