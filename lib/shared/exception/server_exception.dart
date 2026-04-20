import 'package:dio/dio.dart';

class ServerException implements Exception {
  final String message;
  final int? statusCode;

  ServerException({required this.message, this.statusCode});

  factory ServerException.fromDio(dynamic error) {
    if (error is DioException) {
      final data = error.response?.data;

      String message = 'Server error';

      if (data is Map<String, dynamic>) {
        message = data['message'] ?? message;
      }

      return ServerException(
        message: message,
        statusCode: error.response?.statusCode,
      );
    }

    return ServerException(message: 'Unexpected error');
  }
}
