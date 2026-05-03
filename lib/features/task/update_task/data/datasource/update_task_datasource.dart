import 'package:staffops/features/task/detail_task/data/model/actor/actor_model.dart';
import 'package:staffops/features/task/detail_task/data/model/task/priority_model.dart';
import 'package:staffops/features/task/detail_task/data/model/task/task_model.dart';
import 'package:staffops/features/task/update_task/data/model/edited_body.dart';

abstract class UpdateTaskDatasource {
  Future<TaskModel> getTaskPreview(int id);

  Future<List<ActorModel>> getUsersList();

  Future<List<PriorityModel>> getPriorList();

  Future<void> updateTask(EditedBody body, int id);
}
