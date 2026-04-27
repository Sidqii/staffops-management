import 'package:mini_project_e2e_app/features/task/detail_task/domain/entities/task_detail.dart';

abstract class DetailTaskRepository {
  Future<TaskDetail> fetchTaskDetail(int id);
}
