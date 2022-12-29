import 'package:consultancy/src/api/BaseApiServicei.dart';

import '../api/NetworkApiService.dart';
import '../utils/app_url.dart';

class AuthRepository {
  BaseApiService apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic responce =
          await apiService.getPostApiResponse(AppUrl.login, data);
      print(responce.toString() + 'response');
      return responce;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic responce =
          await apiService.getPostApiResponse(AppUrl.register, data);
    } catch (e) {
      throw e;
    }
  }
}
