// ignore_for_file: no_duplicate_case_values

import 'package:consultancy/utils/routes/routes_names.dart';
import 'package:consultancy/views/home/home_screen.dart';
import 'package:consultancy/views/home/notification/notifications_screen.dart';
import 'package:consultancy/views/home/setting/setting_screen.dart';
import 'package:consultancy/views/login/login_screen.dart';
import 'package:consultancy/views/register/register_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Login());
      case RoutesName.register:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Register());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      case RoutesName.notification:
        return MaterialPageRoute(
            builder: (BuildContext context) => const NotificationScreen());

      case RoutesName.notification:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Setting());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
