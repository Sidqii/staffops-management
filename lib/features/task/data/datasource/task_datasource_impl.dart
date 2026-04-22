import 'package:dio/dio.dart';
import 'package:mini_project_e2e_app/features/task/data/datasource/task_datasource.dart';
import 'package:mini_project_e2e_app/features/task/data/model/request/create_task_request.dart';

class TaskDatasourceImpl implements TaskDatasource {
  final Dio dio;

  TaskDatasourceImpl(this.dio);

  @override
  Future<void> createTask(CreateTaskRequest body) async {
    final formData = await body.toFormData();

    await dio.post('/tasks', data: formData);
  }
}
