import 'package:dio/dio.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/data/model/actor/actor_model.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/data/model/task/priority_model.dart';

abstract class CreateTaskRepository {
  Future<List<ActorModel>> listOfUser();

  Future<List<PriorityModel>> listOfPriority();

  Future<void> createTask(FormData formData);
}
