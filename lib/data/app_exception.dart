class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataExceptions extends AppException {
  FetchDataExceptions([String? message])
      : super(message, 'Error during communication');
}

class BadreqException extends AppException {
  BadreqException([String? message]) : super(message, 'Request is invalid');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, 'Unauthorised request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}
