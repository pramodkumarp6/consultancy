import 'dart:async';

import 'package:consultancy/src/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(context, RoutesName.login),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        //child:FlutterLogo(size:MediaQuery.of(context).size.height)
        child: Image.asset('assets/images/spl.png'));
  }
}
