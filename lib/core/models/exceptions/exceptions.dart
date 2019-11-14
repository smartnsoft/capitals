class ServerException implements Exception {
  final int statusCode;

  ServerException({
    this.statusCode,
  });
}

class NetworkException implements Exception {
  static const DIO_NETWORK_EXCEPTION_MESSAGE = "SocketException: Failed host lookup";
}
