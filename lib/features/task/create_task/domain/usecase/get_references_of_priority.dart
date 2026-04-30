import 'package:mini_project_e2e_app/features/task/create_task/data/model/response/priority_response.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/repositories/create_task_repository.dart';

class GetReferencesOfPriority {
  final CreateTaskRepository repository;

  GetReferencesOfPriority(this.repository);

  Future<List<PriorityResponse>> execute() async {
    return repository.listOfPriority();
  }
}
