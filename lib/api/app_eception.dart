class AppException implements Exception {
  final _message;
  final _prefix;

  AppException(this._message, this._prefix);

  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException{
  FetchDataException([String? message]) : super(message, 'Error During Communication');

}
class BadRequestException extends AppException{
  BadRequestException([String? message]) : super(message, 'Invalid Request ');

}

class UnAuthrousedException extends AppException{
  UnAuthrousedException([String? message]) : super(message, 'UnAuthrousedException');

}

class InvaliException extends AppException{
  InvaliException([String? message]) : super(message, 'Invalid Request ');

}