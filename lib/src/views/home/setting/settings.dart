import 'package:consultancy/src/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            tooltip: "Cancel and Return to List",
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.home);
            }),
        centerTitle: true,
        title: const Text("Settings"),
      ),
      body: Center(child: const Text('Setting')),
    );
  }
}
