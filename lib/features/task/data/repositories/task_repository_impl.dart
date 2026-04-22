import 'package:mini_project_e2e_app/features/task/data/datasource/task_datasource.dart';
import 'package:mini_project_e2e_app/features/task/data/model/request/create_task_request.dart';
import 'package:mini_project_e2e_app/features/task/data/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDatasource datasource;

  TaskRepositoryImpl(this.datasource);

  @override
  Future<void> createTask(CreateTaskRequest body) async {
    await datasource.createTask(body);
  }
}