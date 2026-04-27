import 'package:mini_project_e2e_app/features/task/create_task/data/repositories/create_task_repository.dart';
import 'package:mini_project_e2e_app/features/task/create_task/domain/entities/user_list.dart';

class GetReferencesOfUser {
  final CreateTaskRepository repository;

  GetReferencesOfUser(this.repository);

  Future<List<UserList>> execute() async {
    return repository.listOfUser();
  }
}
