class AppException implements Exception {

  final _prefix;
  final _message;

  AppException([this._prefix, this._message]);

  String toString(){
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super("Error During Communication", message);
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super("Invalid Request", message);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super("Unauthorised Request", message);
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super("Invalid Input", message);
}