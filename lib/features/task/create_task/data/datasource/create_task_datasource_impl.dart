import 'package:dio/dio.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/datasource/create_task_datasource.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/model/response/priority_response.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/model/response/user_response.dart';
import 'package:mini_project_e2e_app/shared/exception/server_exception.dart';

class CreateTaskDatasourceImpl implements CreateTaskDatasource {
  final Dio dio;

  CreateTaskDatasourceImpl(this.dio);

  @override
  Future<List<UserResponse>> fetchListOfUsers() async {
    try {
      final response = await dio.get('/users');

      final data = response.data['data'];

      return (data as List).map((e) => UserResponse.fromJson(e)).toList();
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<List<PriorityResponse>> fetchListOfPriority() async {
    try {
      final response = await dio.get('/priority');

      final data = response.data['data'];

      return (data as List).map((e) => PriorityResponse.fromJson(e)).toList();
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<void> createTask(FormData formData) async {
    try {
      await dio.post('/tasks', data: formData);
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }
}
