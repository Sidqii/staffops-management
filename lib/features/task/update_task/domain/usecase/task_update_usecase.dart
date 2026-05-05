import 'package:staffops/features/task/update_task/data/model/update_task_body.dart';
import 'package:staffops/features/task/update_task/data/repositories/update_task_repository.dart';

class TaskUpdateUsecase {
  final UpdateTaskRepository repository;

  TaskUpdateUsecase(this.repository);

  Future<void> execute(UpdateTaskBody body, int id) async {
    await repository.editedTask(await body.toFormData(), id);
  }
}
