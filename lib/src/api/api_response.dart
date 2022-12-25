// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names


import 'package:consultancy/src/api/status.dart';



class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponse(this.status, this.data, this.message);
  ApiResponse.loding() : status = Status.LOADING;
  ApiResponse.completed() : status = Status.COMPLETED;
  ApiResponse.error() : status = Status.ERROR;


 
  String toString(){
    return " $status, $data,$message";

  }
}
