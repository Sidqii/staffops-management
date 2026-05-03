import 'package:staffops/features/task/create_task/data/repositories/create_task_repository.dart';
import 'package:staffops/features/task/detail_task/data/model/actor/actor_model.dart';

class GetReferencesOfUser {
  final CreateTaskRepository repository;

  GetReferencesOfUser(this.repository);

  Future<List<ActorModel>> execute() async {
    return repository.listOfUser();
  }
}
