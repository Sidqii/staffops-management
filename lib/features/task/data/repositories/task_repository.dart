import 'package:mini_project_e2e_app/features/task/data/model/request/create_task_request.dart';

abstract class TaskRepository {
  Future<void> createTask(CreateTaskRequest body);
}