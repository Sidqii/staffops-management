import 'package:mini_project_e2e_app/features/create_task/data/model/request/create_task_request.dart';
import 'package:mini_project_e2e_app/features/create_task/data/repositories/task_repository.dart';

class CreateTaskUsecase {
  final TaskRepository repository;

  CreateTaskUsecase(this.repository);

  Future<void> execute(CreateTaskRequest request) async {
    await repository.createTask(await request.toFormData());
  }
}
