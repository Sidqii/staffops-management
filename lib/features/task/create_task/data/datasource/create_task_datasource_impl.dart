import 'package:dio/dio.dart';
import 'package:staffops/features/auth/data/models/response/user_model.dart';
import 'package:staffops/features/task/create_task/data/datasource/create_task_datasource.dart';
import 'package:staffops/features/task/detail_task/data/model/task/priority_model.dart';
import 'package:staffops/shared/exception/server_exception.dart';

class CreateTaskDatasourceImpl implements CreateTaskDatasource {
  final Dio dio;

  CreateTaskDatasourceImpl(this.dio);

  @override
  Future<List<UserModel>> fetchListOfUsers() async {
    try {
      final response = await dio.get('/users');

      final data = response.data['data'];

      return (data as List).map((e) => UserModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<List<PriorityModel>> fetchListOfPriority() async {
    try {
      final response = await dio.get('/priority');

      final data = response.data['data'];

      return (data as List).map((e) => PriorityModel.fromJson(e)).toList();
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
