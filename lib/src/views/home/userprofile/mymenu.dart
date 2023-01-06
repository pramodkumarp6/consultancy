import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyMenu extends StatelessWidget {
  final String title;
  final IconData iconData;
  final MaterialColor materialColor;
  const MyMenu(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.materialColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Icon(
              Icons.home,
              size: 70.0,
            ),
            Text(
              title,
              style: new TextStyle(fontSize: 17.0),
            )
          ]),
        ),
      ),
    );
  }
}
