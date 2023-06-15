import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences_app/providers/theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<String> radioOptions = ["System default", "Light", "Dark"];
  String? radioGroupValue = "System default";
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
                  title: const Text("System default"),
                  value: radioOptions[0],
                  groupValue: radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      radioGroupValue = value;
                      chosenTheme = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Light"),
                  value: "Light",
                  groupValue: radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      radioGroupValue = value;
                      chosenTheme = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Dark"),
                  value: radioOptions[2],
                  groupValue: radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      radioGroupValue = value;
                      chosenTheme = value!;
                    });
                  },
                ),
              ]),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<ThemeProvider>().thememode = chosenTheme;

                      Navigator.of(context).pop();
                    },
                    child: const Text("Ok"),
                  ),
                ],
              )
            ],
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
