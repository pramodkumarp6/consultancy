import 'package:flutter/material.dart';

import '../../res/components/roundButton.dart';
import '../../utils/routes/routes_names.dart';

class Complete extends StatefulWidget {
  const Complete({Key? key}) : super(key: key);

  @override
  State<Complete> createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple,
          elevation: 0,
          title: const Text('Complete'),
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              tooltip: "Cancel and Return to List",
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.login);
              }),
          centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: hight * .1),
                const Text(
                  'Update Password',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(height: hight * .60),
                RoundButton(
                  title: 'Complete',
                  loading: false,
                  onPress: () {
                    Navigator.pushNamed(context, RoutesName.login);

                    // Toasty.toastMessage('Email & Password InvaLid');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
