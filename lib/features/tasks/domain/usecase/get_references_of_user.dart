import 'package:mini_project_e2e_app/features/tasks/data/repositories/task_repository.dart';
import 'package:mini_project_e2e_app/features/tasks/domain/entities/user_list.dart';

class GetReferencesOfUser {
  final TaskRepository repository;

  GetReferencesOfUser(this.repository);

  Future<List<UserList>> execute() async {
    return repository.listOfUser();
  }
}
