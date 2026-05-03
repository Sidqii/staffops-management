import 'package:staffops/features/task/create_task/data/model/create_task_request.dart';
import 'package:staffops/features/task/create_task/data/repositories/create_task_repository.dart';

class CreateTaskUsecase {
  final CreateTaskRepository repository;

  CreateTaskUsecase(this.repository);

  Future<void> execute(CreateTaskRequest request) async {
    await repository.createTask(await request.toFormData());
  }
}
