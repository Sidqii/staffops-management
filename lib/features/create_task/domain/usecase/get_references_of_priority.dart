import 'package:mini_project_e2e_app/features/create_task/data/repositories/task_repository.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/entities/priority_list.dart';

class GetReferencesOfPriority {
  final TaskRepository repository;

  GetReferencesOfPriority(this.repository);

  Future<List<PriorityList>> execute() async {
    return repository.listOfPriority();
  }
}
