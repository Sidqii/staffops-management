import 'package:mini_project_e2e_app/features/task/detail_task/data/repositories/detail_task_repository.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/domain/entities/task_detail.dart';

class GetTaskDetail {
  final DetailTaskRepository repository;

  GetTaskDetail(this.repository);

  Future<TaskDetail> execute(int id) async {
    return await repository.fetchTaskDetail(id);
  }
}
