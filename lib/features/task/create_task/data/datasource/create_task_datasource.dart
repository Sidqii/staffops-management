import 'package:dio/dio.dart';
import 'package:staffops/features/task/detail_task/data/model/actor/actor_model.dart';
import 'package:staffops/features/task/detail_task/data/model/task/priority_model.dart';

abstract class CreateTaskDatasource {
  Future<List<ActorModel>> fetchListOfUsers();

  Future<List<PriorityModel>> fetchListOfPriority();

  Future<void> createTask(FormData formData);
}
