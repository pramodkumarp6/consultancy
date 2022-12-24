import 'package:consultancy/views/home/MyHeader.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Dashboar"),
      ),
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
      child: Column(),
    );
  }

  Widget menuItem() {
    return Material(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              const Expanded(
                child: Icon(
                  Icons.dashboard_outlined,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
