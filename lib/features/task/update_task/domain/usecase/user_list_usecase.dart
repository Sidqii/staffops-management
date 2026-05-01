import 'package:mini_project_e2e_app/features/task/update_task/data/repositories/update_task_repository.dart';
import 'package:mini_project_e2e_app/shared/entities/user/user.dart';

class UserListUsecase {
  final UpdateTaskRepository repository;

  UserListUsecase(this.repository);

  Future<List<User>> execute() async {
    return await repository.userList();
  }
}