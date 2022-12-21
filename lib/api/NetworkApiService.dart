import 'dart:convert';
import 'dart:io';

import 'package:consultancy/api/BaseApiServicei.dart';
import 'package:consultancy/api/app_eception.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
    } on SocketException {
      throw FetchDataException("InterNet Exception");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, data) {
    throw UnimplementedError();
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

        case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
        case 404:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException('Error' + response.statusCode.toString());



      default:
        throw FetchDataException('Error' + response.statusCode.toString());



      default:
        throw FetchDataException('Error' + response.statusCode.toString());

      

    }
  }
}
