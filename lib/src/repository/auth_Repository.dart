import 'dart:convert';

import 'package:consultancy/src/api/BaseApiServicei.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../api/NetworkApiService.dart';
import '../utils/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.login, data);
      if (kDebugMode) {
        print(response.toString() + "AuthModelPramod");
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic responce =
          await _apiServices.getPostApiResponse(AppUrl.register, data);
      return responce;
    } catch (e) {
      rethrow;
    }
  }
}
