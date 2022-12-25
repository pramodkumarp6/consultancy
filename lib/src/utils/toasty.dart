// ignore_for_file: prefer_typing_uninitialized_variables, empty_constructor_bodies

import 'package:fluttertoast/fluttertoast.dart';

class Toasty {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }
}
