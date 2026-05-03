import 'package:dio/dio.dart';
import 'package:staffops/config/storage/token/token_storage.dart';
import 'package:staffops/features/auth/data/datasource/auth_datasource.dart';
import 'package:staffops/features/auth/data/models/request/sign_in_request.dart';
import 'package:staffops/features/auth/data/models/request/sign_up_request.dart';
import 'package:staffops/features/auth/data/models/response/auth_response.dart';
import 'package:staffops/shared/exception/server_exception.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final Dio dio;
  final TokenStorage storage;

  AuthDatasourceImpl(this.dio, this.storage);

  @override
  Future<void> signUp(SignUpRequest request) async {
    try {
      await dio.post('/register', data: request.toJson());
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<AuthResponse> signIn(SignInRequest request) async {
    try {
      final response = await dio.post('/login', data: request.toJson());

      final data = response.data;

      storage.saveToken(response.data['access_token']);

      return AuthResponse.fromJson(data);
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await dio.post('/logout');

      await storage.clearToken();
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }
}
