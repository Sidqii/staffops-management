import 'package:staffops/features/task/update_task/data/repositories/update_task_repository.dart';
import 'package:staffops/shared/entities/task/priority.dart';

class PrioListUsecase {
  final UpdateTaskRepository repository;

  PrioListUsecase(this.repository);

  Future<List<Priority>> execute() async {
    return await repository.prioList();
  }
}
