import 'package:staffops/features/task/detail_task/data/repositories/detail_task_repository.dart';
import 'package:staffops/shared/entities/task/task.dart';

class GetTaskDetail {
  final DetailTaskRepository repository;

  GetTaskDetail(this.repository);

  Future<Task> execute(int id) async {
    return await repository.fetchTaskDetail(id);
  }
}
