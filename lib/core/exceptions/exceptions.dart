class InvalidCredentialsException implements Exception {
  final String message;
  InvalidCredentialsException(this.message);

  @override
  String toString() => message;
}


class ServerException implements Exception {
  final String message;
  ServerException(this.message);

  @override
  String toString() =>  message;
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  @override
  String toString() =>message;
}
