import 'package:mini_project_e2e_app/features/task/create_task/data/repositories/create_task_repository.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/data/model/task/priority_model.dart';

class GetReferencesOfPriority {
  final CreateTaskRepository repository;

  GetReferencesOfPriority(this.repository);

  Future<List<PriorityModel>> execute() async {
    return repository.listOfPriority();
  }
}
