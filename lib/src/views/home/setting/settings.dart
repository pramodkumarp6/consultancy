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
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              Card(
                //margin: EdgeInsets.all(8.0),
                color: Colors.purple,
                child: ListTile(
                  onTap: () {
                    /// testr
                  },
                  // ignore: prefer_const_constructors
                  title: Text(
                    'User Profile',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  // ignore: prefer_const_constructors
                  leading: CircleAvatar(
                      // backgroundImage: CachedNetworkImageProvider(avatars[0]),
                      ),
                  // ignore: prefer_const_constructors
                  trailing: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
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
                    leading:
                        const Icon(Icons.lock_outline, color: Colors.purple),
                    title: const Text("User Profile"),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      // Click
                    },
                  ),
                  _buildDivider(),
                  ListTile(
                    leading:
                        const Icon(Icons.lock_outline, color: Colors.purple),
                    title: const Text("Password Change"),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.changepassword);
                    },
                  ),
                  _buildDivider(),
                  ListTile(
                    leading:
                        const Icon(Icons.lock_outline, color: Colors.purple),
                    title: const Text("Change Language"),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      // Click
                    },
                  ),
                ]),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Notification Setting',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              ),
              SwitchListTile(
                activeColor: Colors.purple,
                contentPadding: const EdgeInsets.all(0),
                value: true,
                title: const Text('Notification Recieved'),
                onChanged: (bool value) {},
              ),
              SwitchListTile(
                activeColor: Colors.purple,
                contentPadding: const EdgeInsets.all(0),
                value: true,
                title: const Text('Dark Mode'),
                onChanged: (bool value) {},
              )
            ],

            //child: Center(child: Card(elevation: 5, child: Text('Setting'))),
          )),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey,
    );
  }
}
