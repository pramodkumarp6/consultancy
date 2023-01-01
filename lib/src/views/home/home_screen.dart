import 'package:consultancy/src/utils/routes/routes_names.dart';
import 'package:consultancy/src/views/home/chat/chat.dart';
import 'package:consultancy/src/views/home/events.dart';
import 'package:consultancy/src/views/home/location/location.dart';
import 'package:consultancy/src/views/home/my_drawer_header.dart';
import 'package:consultancy/src/views/home/notes.dart';
import 'package:consultancy/src/views/home/privacy_policy.dart';
import 'package:consultancy/src/views/home/profile/userProfile.dart';
import 'package:consultancy/src/views/home/send_feedback.dart';
import 'package:consultancy/src/views/home/userDetails.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentPage = DrawerSections.userDetails;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.userDetails) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.userProfile) {
      container = const Profile();
    } else if (currentPage == DrawerSections.events) {
      container = EventsPage();
    } else if (currentPage == DrawerSections.notes) {
      container = NotesPage();
    } else if (currentPage == DrawerSections.location) {
      container = const Location();
    } else if (currentPage == DrawerSections.chat) {
      container = const Chat();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = SendFeedbackPage();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboar"),
        backgroundColor: Colors.purple,
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
          PopupMenuButton<MenuValues>(
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                child: Text('Settings'),
                value: MenuValues.setting,
              ),
              const PopupMenuItem(
                child: Text('Logout'),
                value: MenuValues.logout,
              ),
            ],
            onSelected: (value) {
              switch (value) {
                case MenuValues.setting:
                  Navigator.pushNamed(context, RoutesName.setting);
                  break;

                case MenuValues.logout:
                  Navigator.pushNamed(context, RoutesName.login);

                  break;
              }
            },
          ),
        ],
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "UserDetails", Icons.dashboard_outlined,
              currentPage == DrawerSections.userDetails ? true : false),
          menuItem(2, "UserProfile", Icons.person_off_outlined,
              currentPage == DrawerSections.userProfile ? true : false),
          menuItem(3, "Events", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Notes", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
          const Divider(),
          menuItem(5, "Location", Icons.location_city,
              currentPage == DrawerSections.location ? true : false),
          menuItem(6, "Chat", Icons.chat,
              currentPage == DrawerSections.chat ? true : false),
          const Divider(),
          menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(8, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
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
              currentPage = DrawerSections.userDetails;
            } else if (id == 2) {
              currentPage = DrawerSections.userProfile;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.location;
            } else if (id == 6) {
              currentPage = DrawerSections.chat;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
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
  dashboard,
  userProfile,
  events,
  notes,
  location,
  chat,
  privacy_policy,
  send_feedback,
  userDetails,
}

enum MenuValues { setting, logout }
