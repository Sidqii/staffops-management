import 'package:mini_project_e2e_app/features/task/detail_task/data/model/task/task_model.dart';

abstract class DetailTaskDatasource {
  Future<TaskModel> getTaskDetail(int id);
}