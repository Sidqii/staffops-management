import 'package:staffops/features/task/update_task/data/model/edited_body.dart';
import 'package:staffops/features/task/update_task/data/repositories/update_task_repository.dart';

class TaskUpdateUsecase {
  final UpdateTaskRepository repository;

  TaskUpdateUsecase(this.repository);

  Future<void> execute(EditedBody body, int id) async {
    return await repository.editedTask(body, id);
  }
}
