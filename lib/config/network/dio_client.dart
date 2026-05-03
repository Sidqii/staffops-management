import 'package:dio/dio.dart';
import 'package:staffops/config/network/api_config.dart';
import 'package:staffops/config/storage/token/token_storage.dart';

class DioClient {
  final TokenStorage tokenStorage;
  late final Dio dio;

  DioClient(this.tokenStorage) {
    dio = Dio(
      BaseOptions(
        baseUrl: '${ApiConfig.baseUrl}/api',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Accept': 'application/json'},
      ),
    );
    _addInterceptor();
  }

  void _addInterceptor() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await tokenStorage.getToken();

          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },

        onResponse: (response, handler) {
          return handler.next(response);
        },

        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }
}
