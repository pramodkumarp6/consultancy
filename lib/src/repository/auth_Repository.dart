// ignore: file_names
import 'package:consultancy/api/BaseApiServicei.dart';
import 'package:consultancy/api/NetworkApiService.dart';
import 'package:consultancy/utils/app_url.dart';

class AuthRepository {
  BaseApiService apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic responce =await apiService.getPostApiResponse(AppUrl.login, data); 
    } catch (e) {
      throw e;
    }
  }



Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic responce =await apiService.getPostApiResponse(AppUrl.register, data); 
    } catch (e) {
      throw e;
    }
  }


}
