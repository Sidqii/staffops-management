import 'package:staffops/features/task/detail_task/data/datasource/detail_task_datasource.dart';
import 'package:staffops/features/task/detail_task/data/repositories/detail_task_repository.dart';
import 'package:staffops/shared/entities/task/task.dart';

class DetailTaskRepositoryImpl implements DetailTaskRepository {
  final DetailTaskDatasource datasource;

  DetailTaskRepositoryImpl(this.datasource);

  @override
  Future<Task> fetchTaskDetail(int id) async {
    final result = await datasource.getTaskDetail(id);

    return result.toEntity();
  }
}
