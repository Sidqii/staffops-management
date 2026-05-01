import 'package:mini_project_e2e_app/shared/entities/task/task.dart';

abstract class DetailTaskRepository {
  Future<Task> fetchTaskDetail(int id);
}
