class AppException implements Exception {
  String? _message;
  String? _prefix;

  AppException(this._message, this._prefix);
  @override
  String toString() {
    return 'Message : $_message Prefix $_prefix';
  }
}

class InternetException extends AppException {
  InternetException(String? message) : super(message, 'No Internet');
}

class NetworkError extends AppException {
  NetworkError(String? message) : super(message, 'Network Error');
}
