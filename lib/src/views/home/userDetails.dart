import 'package:consultancy/src/views/splash/splash_screen.dart';
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
        padding: EdgeInsets.all(30.0),
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
                    ),
                    Text(
                      'Home',
                      style: new TextStyle(fontSize: 17.0),
                    )
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
