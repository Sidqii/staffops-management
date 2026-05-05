import 'package:staffops/features/task/delete_task/data/datasource/delete_task_datasource.dart';

abstract class DeleteTaskRepository {
  Future<void> deleteTask(int id);
}

class DeleteTaskRepsitoryImpl implements DeleteTaskRepository {
  final DeleteTaskDatasource datasource;

  DeleteTaskRepsitoryImpl(this.datasource);

  @override
  Future<void> deleteTask(int id) async {
    await datasource.deleteTask(id);
  }
}
