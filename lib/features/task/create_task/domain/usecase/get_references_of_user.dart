import 'package:mini_project_e2e_app/features/task/create_task/data/model/response/user_response.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/repositories/create_task_repository.dart';

class GetReferencesOfUser {
  final CreateTaskRepository repository;

  GetReferencesOfUser(this.repository);

  Future<List<UserResponse>> execute() async {
    return repository.listOfUser();
  }
}
