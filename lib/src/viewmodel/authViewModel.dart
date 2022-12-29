// ignore_for_file: file_names

import 'package:consultancy/src/repository/auth_Repository.dart';
import 'package:consultancy/src/utils/toasty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AuthViewModel with ChangeNotifier {
  final repository = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    repository.loginApi(data).then((value) {
      if (kDebugMode) {
        print(data.value.toString() + "Pramod");
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString() + "Pramod Error");
        Toasty.snackebar(error.toString(), context);
      }
    });
  }
}
