import 'package:dio/dio.dart';
import 'package:mini_project_e2e_app/features/task/update_task/data/model/request/edited_body.dart';
import 'package:mini_project_e2e_app/features/task/update_task/data/model/response/updated_task_response.dart';
import 'package:mini_project_e2e_app/shared/exception/server_exception.dart';

abstract class UpdateTaskDatasource {
  Future<UpdatedTaskResponse> getTaskWillEdited(int id);

  Future<void> updateTask(EditedBody body, int id);
}

class UpdateTaskDatasourceImpl implements UpdateTaskDatasource {
  final Dio dio;

  UpdateTaskDatasourceImpl(this.dio);

  @override
  Future<UpdatedTaskResponse> getTaskWillEdited(int id) async {
    try {
      final response = await dio.get('/tasks/$id');

      return UpdatedTaskResponse.fromJson(response.data['data']);
    } on ServerException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<void> updateTask(EditedBody body, int id) async {
    try {
      await dio.put('/tasks/$id', data: body.toJson());
    } on ServerException catch (e) {
      throw ServerException.fromDio(e);
    }
  }
}
