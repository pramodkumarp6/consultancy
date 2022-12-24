import 'package:consultancy/views/home/MyHeader.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/routes_names.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var appBar2 = AppBar(
      backgroundColor: Colors.purple,
      title: const Text("Dashboar"),
      // leading: IconButton(
      //   icon: const Icon(Icons.menu),
      //   onPressed: () {},
      // ),
      elevation: 1.0,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notification_add,
          ),
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.notification);
          },
        ),
        PopupMenuButton(
            itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(
                    child: Text('Setting'),
                  ),
                  const PopupMenuItem(
                    child: Text('Logout'),
                  ),
                ]),
      ],
    );
    return Scaffold(
      appBar: appBar2,
      body: Container(
        child: const Center(
          child: Text("Home Pages"),
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
            child: Container(
                child: Column(
          children: [
            const MyHeader(),
            MyDrawerList(),
          ],
        ))),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [menuItem()],
      ),
    );
  }

  Widget menuItem() {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Expanded(
                flex: 1,
                child: Icon(
                  Icons.navigation,
                  size: 20,
                  color: Colors.red,
                ),
              ),
              const Expanded(
                flex: 3,
                child: Text(
                  "UserProfile",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  // ignore: constant_identifier_names
  UserProfile,
  contacts,
  events,
  notes,
  settings,
  notifications,
  // ignore: constant_identifier_names
  privacy_policy,
  // ignore: constant_identifier_names
  send_feedback,
}
