import 'package:mini_project_e2e_app/features/home/data/models/request/filter_query_params.dart';
import 'package:mini_project_e2e_app/features/home/data/models/response/home_pagination.dart';

abstract class HomeDatasource {
  Future<PaginationResponse> getTaskList(FilterQueryParams params);
}
