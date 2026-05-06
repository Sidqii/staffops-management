import 'package:staffops/features/auth/data/models/response/user_model.dart';
import 'package:staffops/features/task/create_task/data/repositories/create_task_repository.dart';

class GetReferencesOfUser {
  final CreateTaskRepository repository;

  GetReferencesOfUser(this.repository);

  Future<List<UserModel>> execute() async {
    return repository.listOfUser();
  }
}
