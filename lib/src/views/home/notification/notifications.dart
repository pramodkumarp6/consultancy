import 'package:consultancy/src/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
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
        title: const Text("Notification"),
      ),
      body: Center(child: Text('Notification')),
    );
  }
}
