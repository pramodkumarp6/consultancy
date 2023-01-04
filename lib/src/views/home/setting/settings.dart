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
      backgroundColor: Colors.grey.shade200,
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
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Card(
            margin: EdgeInsets.all(8.0),
            color: Colors.purple,
            child: ListTile(
              title: Text(
                'User Profile',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              leading: CircleAvatar(
                  // backgroundImage: CachedNetworkImageProvider(avatars[0]),
                  ),
              trailing: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              //  onTap: (),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Card(
            elevation: 7,
            margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(children: <Widget>[
              ListTile(
                leading: const Icon(Icons.lock_outline, color: Colors.purple),
                title: const Text("User Profile"),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  // Click
                },
              ),
              Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey,
              ),
              ListTile(
                leading: const Icon(Icons.lock_outline, color: Colors.purple),
                title: const Text("Password Change"),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.changepassword);
                },
              ),
              Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey,
              ),
              ListTile(
                leading: const Icon(Icons.lock_outline, color: Colors.purple),
                title: const Text("Change Language"),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  // Click
                },
              ),
            ]),
          ),
        ],

        //child: Center(child: Card(elevation: 5, child: Text('Setting'))),
      )),
    );
  }
}
