import 'package:mini_project_e2e_app/features/task/detail_task/data/model/task_detail_response.dart';

abstract class DetailTaskDatasource {
  Future<TaskDetailResponse> getTaskDetail(int id);
}