// ignore_for_file: prefer_typing_uninitialized_variables, empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toasty {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static snackebar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }


  static void flushbar(String message, BuildContext context){
    
  }
}
