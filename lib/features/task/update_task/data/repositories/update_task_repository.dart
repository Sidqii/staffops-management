import 'package:mini_project_e2e_app/features/task/update_task/data/datasource/update_task_datasource.dart';
import 'package:mini_project_e2e_app/features/task/update_task/data/model/edited_body.dart';
import 'package:mini_project_e2e_app/shared/entities/task/priority.dart';
import 'package:mini_project_e2e_app/shared/entities/task/task.dart';
import 'package:mini_project_e2e_app/shared/entities/user/user.dart';

abstract class UpdateTaskRepository {
  Future<Task> previewEdited(int id);

  Future<List<User>> userList();

  Future<List<Priority>> prioList();

  Future<void> editedTask(EditedBody body, int id);
}

class UpdateTaskRepositoryImpl implements UpdateTaskRepository {
  final UpdateTaskDatasource datasource;

  UpdateTaskRepositoryImpl(this.datasource);

  @override
  Future<Task> previewEdited(int id) async {
    final result = await datasource.getTaskPreview(id);

    return result.toEntity();
  }

  @override
  Future<void> editedTask(EditedBody body, int id) async {
    await datasource.updateTask(body, id);
  }

  @override
  Future<List<User>> userList() async {
    final result = await datasource.getUsersList();

    return result.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<Priority>> prioList() async {
    final result = await datasource.getPriorList();

    return result.map((e) => e.toEntiy()).toList();
  }
}
