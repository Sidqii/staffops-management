import 'package:staffops/features/task/update_task/data/repositories/update_task_repository.dart';
import 'package:staffops/shared/entities/user/user.dart';

class UserListUsecase {
  final UpdateTaskRepository repository;

  UserListUsecase(this.repository);

  Future<List<User>> execute() async {
    return await repository.userList();
  }
}