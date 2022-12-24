import 'package:flutter/material.dart';

class MyHeader extends StatefulWidget {
  const MyHeader({Key? key}) : super(key: key);

  @override
  State<MyHeader> createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profile.jpg'),
              ),
            ),
          ),
          const Text(
            "Consultancy",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const Text(
            "pramodkumarp6@gmail.com",
            style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
