import 'package:dio/dio.dart';
import 'package:mini_project_e2e_app/features/tasks/data/datasource/task_datasource.dart';
import 'package:mini_project_e2e_app/features/tasks/data/model/response/list_of_priority.dart';
import 'package:mini_project_e2e_app/features/tasks/data/model/response/list_of_user.dart';
import 'package:mini_project_e2e_app/shared/exception/server_exception.dart';

class TaskDatasourceImpl implements TaskDatasource {
  final Dio dio;

  TaskDatasourceImpl(this.dio);

  @override
  Future<List<ListOfUser>> fetchListOfUsers() async {
    try {
      final response = await dio.get('/users');

      final data = response.data['data'];

      return (data as List).map((e) => ListOfUser.fromJson(e)).toList();
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<List<ListOfPriority>> fetchListOfPriority() async {
    try {
      final response = await dio.get('/priority');

      final data = response.data['data'];

      return (data as List).map((e) => ListOfPriority.fromJson(e)).toList();
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
