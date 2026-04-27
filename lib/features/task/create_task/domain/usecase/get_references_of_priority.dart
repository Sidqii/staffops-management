import 'package:mini_project_e2e_app/features/task/create_task/data/repositories/create_task_repository.dart';
import 'package:mini_project_e2e_app/features/task/create_task/domain/entities/priority_list.dart';

class GetReferencesOfPriority {
  final CreateTaskRepository repository;

  GetReferencesOfPriority(this.repository);

  Future<List<PriorityList>> execute() async {
    return repository.listOfPriority();
  }
}
