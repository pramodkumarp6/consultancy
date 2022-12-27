// ignore_for_file: no_duplicate_case_values

import 'package:consultancy/src/utils/routes/routes_names.dart';
import 'package:consultancy/src/views/forgetuser/complete_screen.dart';
import 'package:consultancy/src/views/forgetuser/forgetUser_screen.dart';
import 'package:consultancy/src/views/forgetuser/otp_send_verify.dart';
import 'package:consultancy/src/views/forgetuser/password_update_screen.dart';
import 'package:consultancy/src/views/home/home_screen.dart';
import 'package:consultancy/src/views/home/notification/notifications_screen.dart';
import 'package:consultancy/src/views/home/setting/setting_screen.dart';
import 'package:consultancy/src/views/home/userPasswprdChange/user_password_change.dart';
import 'package:consultancy/src/views/login/login_screen.dart';
import 'package:consultancy/src/views/register/register_screen.dart';
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

      case RoutesName.forgetUser:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ForgetUser());

      case RoutesName.otpSend:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OtpSendVerify());

      case RoutesName.passupdate:
        return MaterialPageRoute(
            builder: (BuildContext context) => const PasswordUpdate());

      case RoutesName.complete:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Complete());

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
