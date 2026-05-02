import 'package:mini_project_e2e_app/features/home/data/models/request/filter_query_params.dart';
import 'package:mini_project_e2e_app/features/home/data/models/response/dashboard_paginate.dart';

abstract class HomeDatasource {
  Future<DashboardPaginate> getTaskList(FilterQueryParams params);
}
