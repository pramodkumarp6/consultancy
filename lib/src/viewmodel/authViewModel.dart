// ignore_for_file: file_names

import 'package:consultancy/src/repository/auth_Repository.dart';
import 'package:consultancy/src/utils/toasty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AuthViewModel with ChangeNotifier {
  final repository = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    repository.loginApi(data).then((value) {
      if (kDebugMode) {
        print(data.toString() + "ViewModel");
        Toasty.snackebar("Login successfully !!!", context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
        Toasty.snackebar(error.toString(), context);
      }
    });
  }
}
