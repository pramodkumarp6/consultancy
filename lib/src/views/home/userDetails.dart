import 'package:consultancy/src/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Center(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Icon(
                      Icons.home,
                      size: 70.0,
                      color: Colors.indigo,
                    ),
                    Text(
                      'Home',
                      style: new TextStyle(fontSize: 17.0),
                    )
                  ]),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Center(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 70.0,
                      color: Colors.indigo,
                    ),
                    Text(
                      'UserProfile',
                      style: new TextStyle(fontSize: 17.0),
                    )
                  ]),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Center(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    // ignore: prefer_const_constructors
                    Icon(
                      Icons.chat,
                      size: 70.0,
                      color: Colors.indigo,
                    ),
                    Text(
                      'Chat',
                      style: new TextStyle(fontSize: 17.0),
                    )
                  ]),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, RoutesName.location);
                },
                child: Center(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Icon(
                      Icons.location_on,
                      size: 70.0,
                      color: Colors.indigo,
                    ),
                    Text(
                      'Location',
                      style: new TextStyle(fontSize: 17.0),
                    )
                  ]),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Center(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 70.0,
                      color: Colors.indigo,
                    ),
                    Text(
                      'UserDetils',
                      style: new TextStyle(fontSize: 17.0),
                    )
                  ]),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Center(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Icon(
                      Icons.password,
                      size: 70.0,
                      color: Colors.indigo,
                    ),
                    Text(
                      'PasswordUpdate',
                      style: new TextStyle(fontSize: 17.0),
                    )
                  ]),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.setting);
                },
                child: Center(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Icon(
                      Icons.settings,
                      size: 70.0,
                      color: Colors.indigo,
                    ),
                    Text(
                      'Setting',
                      style: new TextStyle(fontSize: 17.0),
                    )
                  ]),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.notification);
                },
                child: Center(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Icon(
                      Icons.notifications,
                      size: 70.0,
                      color: Colors.indigo,
                    ),
                    Text(
                      'Notifications',
                      style: new TextStyle(fontSize: 17.0),
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
