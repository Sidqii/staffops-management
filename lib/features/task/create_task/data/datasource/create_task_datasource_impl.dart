import 'package:dio/dio.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/datasource/create_task_datasource.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/data/model/actor/actor_model.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/data/model/task/priority_model.dart';
import 'package:mini_project_e2e_app/shared/exception/server_exception.dart';

class CreateTaskDatasourceImpl implements CreateTaskDatasource {
  final Dio dio;

  CreateTaskDatasourceImpl(this.dio);

  @override
  Future<List<ActorModel>> fetchListOfUsers() async {
    try {
      final response = await dio.get('/users');

      final data = response.data['data'];

      return (data as List).map((e) => ActorModel.fromJson(e)).toList();
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
