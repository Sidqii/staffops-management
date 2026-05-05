import 'package:dio/dio.dart';
import 'package:staffops/features/task/detail_task/data/model/actor/actor_model.dart';
import 'package:staffops/features/task/detail_task/data/model/task/priority_model.dart';
import 'package:staffops/features/task/detail_task/data/model/task/task_model.dart';

abstract class UpdateTaskDatasource {
  Future<TaskModel> getTaskPreview(int id);

  Future<List<ActorModel>> getUsersList();

  Future<List<PriorityModel>> getPriorList();

  Future<void> updateTask(FormData formData, int id);
}
