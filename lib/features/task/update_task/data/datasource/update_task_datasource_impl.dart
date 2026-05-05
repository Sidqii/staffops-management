import 'package:dio/dio.dart';
import 'package:staffops/features/task/detail_task/data/model/actor/actor_model.dart';
import 'package:staffops/features/task/detail_task/data/model/task/priority_model.dart';
import 'package:staffops/features/task/detail_task/data/model/task/task_model.dart';
import 'package:staffops/features/task/update_task/data/datasource/update_task_datasource.dart';
import 'package:staffops/shared/exception/server_exception.dart';

class UpdateTaskDatasourceImpl implements UpdateTaskDatasource {
  final Dio dio;

  UpdateTaskDatasourceImpl(this.dio);

  @override
  Future<TaskModel> getTaskPreview(int id) async {
    try {
      final response = await dio.get('/tasks/$id');

      return TaskModel.fromJson(response.data['data']);
    } on ServerException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<void> updateTask(FormData formData, int id) async {
    try {
      await dio.post('/tasks/$id', data: formData);
    } on ServerException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<List<PriorityModel>> getPriorList() async {
    try {
      final response = await dio.get('/priority');

      final prioList = response.data['data'] as List;

      return prioList.map((e) => PriorityModel.fromJson(e)).toList();
    } on ServerException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<List<ActorModel>> getUsersList() async {
    try {
      final response = await dio.get('/users');

      final userList = response.data['data'] as List;

      return userList.map((e) => ActorModel.fromJson(e)).toList();
    } on ServerException catch (e) {
      throw ServerException.fromDio(e);
    }
  }
}
