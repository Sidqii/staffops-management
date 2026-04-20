import 'package:mini_project_e2e_app/features/home/data/models/request/task_query_params.dart';
import 'package:mini_project_e2e_app/features/home/data/models/response/pagination_response.dart';

abstract class HomeDatasource {
  Future<PaginationResponse> getTaskList(TaskQueryParams params);
}