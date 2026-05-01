import 'package:dio/dio.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/data/datasource/detail_task_datasource.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/data/model/task/task_model.dart';
import 'package:mini_project_e2e_app/shared/exception/server_exception.dart';

class DetailTaskDatasourceImpl implements DetailTaskDatasource {
  final Dio dio;

  DetailTaskDatasourceImpl(this.dio);

  @override
  Future<TaskModel> getTaskDetail(int id) async {
    try {
      final response = await dio.get('/tasks/$id');

      return TaskModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }
}
