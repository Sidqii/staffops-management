import 'package:staffops/features/task/delete_task/data/repositories/delete_task_repository.dart';

class DeleteTaskUsecase {
  final DeleteTaskRepository repository;

  DeleteTaskUsecase(this.repository);

  Future<void> execute(int id) async {
    await repository.deleteTask(id);
  }
}