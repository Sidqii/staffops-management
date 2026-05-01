import 'package:mini_project_e2e_app/features/task/detail_task/data/datasource/detail_task_datasource.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/data/repositories/detail_task_repository.dart';
import 'package:mini_project_e2e_app/shared/entities/task/task.dart';

class DetailTaskRepositoryImpl implements DetailTaskRepository {
  final DetailTaskDatasource datasource;

  DetailTaskRepositoryImpl(this.datasource);

  @override
  Future<Task> fetchTaskDetail(int id) async {
    final result = await datasource.getTaskDetail(id);

    return result.toEntity();
  }
}
