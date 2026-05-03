import 'package:staffops/features/home/data/models/request/filter_query_params.dart';
import 'package:staffops/features/home/data/models/response/dashboard_paginate.dart';

abstract class HomeDatasource {
  Future<DashboardPaginate> getTaskList(FilterQueryParams params);
}
