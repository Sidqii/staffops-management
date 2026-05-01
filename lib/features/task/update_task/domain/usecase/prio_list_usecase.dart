import 'package:mini_project_e2e_app/features/task/update_task/data/repositories/update_task_repository.dart';
import 'package:mini_project_e2e_app/shared/entities/task/priority.dart';

class PrioListUsecase {
  final UpdateTaskRepository repository;

  PrioListUsecase(this.repository);

  Future<List<Priority>> execute() async {
    return await repository.prioList();
  }
}
