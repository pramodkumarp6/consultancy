import 'package:consultancy/src/views/home/MyHeader.dart';
import 'package:flutter/material.dart';
import '../../utils/routes/routes_names.dart';

import 'chat/chat_screen.dart';
import 'location/location_screen.dart';
import 'notification/notifications_screen.dart';
import 'profile/profile_screen.dart';
import 'sendFeedback/send_feedback.dart';
import 'setting/policy_screen.dart';
import 'setting/setting_screen.dart';
import 'userPasswprdChange/user_password_change.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get onSelected => null;
  var currentPage = DrawerSections.userProfile;

  @override
  Widget build(BuildContext context) {
    var container;

    if (currentPage == DrawerSections.userProfile) {
      container = const Profile();
    } else if (currentPage == DrawerSections.passwordChange) {
      container = const PasswordChange();
    } else if (currentPage == DrawerSections.chat) {
      container = const Chat();
    } else if (currentPage == DrawerSections.location) {
      container = const Location();
    } else if (currentPage == DrawerSections.settings) {
      container = const Setting();
    } else if (currentPage == DrawerSections.notifications) {
      container = const NotificationScreen();
    } else if (currentPage == DrawerSections.privacyPolicy) {
      container = const Policy();
    } else if (currentPage == DrawerSections.sendFeedback) {
      container = const SendFeedback();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboar"),
        backgroundColor: Colors.purple,
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
      ),
      body: Container(
        child: const Center(
          child: Text(" Pramod "),
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

  // ignore: non_constant_identifier_names
  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(1, "UserDetails", Icons.dashboard_outlined,
              currentPage == DrawerSections.userProfile ? true : false),
          menuItem(2, "UserPasswordChange", Icons.people_alt_outlined,
              currentPage == DrawerSections.passwordChange ? true : false),
          menuItem(3, "Chat", Icons.chat,
              currentPage == DrawerSections.chat ? true : false),
          menuItem(4, "Location", Icons.location_city,
              currentPage == DrawerSections.location ? true : false),
          const Divider(),
          menuItem(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          const Divider(),
          menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacyPolicy ? true : false),
          menuItem(8, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.sendFeedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.userProfile;
            } else if (id == 2) {
              currentPage = DrawerSections.passwordChange;
            } else if (id == 3) {
              currentPage = DrawerSections.chat;
            } else if (id == 4) {
              currentPage = DrawerSections.location;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacyPolicy;
            } else if (id == 8) {
              currentPage = DrawerSections.sendFeedback;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  // ignore: constant_identifier_names
  userProfile,
  passwordChange,
  chat,
  location,
  settings,
  notifications,
  privacyPolicy,
  sendFeedback,
}
