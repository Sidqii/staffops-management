import 'package:mini_project_e2e_app/features/task/update_task/data/datasource/update_task_datasource.dart';
import 'package:mini_project_e2e_app/features/task/update_task/data/model/request/edited_body.dart';
import 'package:mini_project_e2e_app/features/task/update_task/data/model/response/updated_task_response.dart';

abstract class UpdateTaskRepository {
  Future<UpdatedTaskResponse> taskViewEdited(int id);

  Future<void> editedTask(EditedBody body, int id);
}

class UpdateTaskRepositoryImpl implements UpdateTaskRepository {
  final UpdateTaskDatasource datasource;

  UpdateTaskRepositoryImpl(this.datasource);

  @override
  Future<UpdatedTaskResponse> taskViewEdited(int id) async {
    return await datasource.getTaskWillEdited(id);
  }

  @override
  Future<void> editedTask(EditedBody body, int id) async {
    await datasource.updateTask(body, id);
  }
}
