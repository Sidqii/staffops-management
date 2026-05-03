import 'package:dio/dio.dart';
import 'package:staffops/features/home/data/datasource/home_datasource.dart';
import 'package:staffops/features/home/data/models/request/filter_query_params.dart';
import 'package:staffops/features/home/data/models/response/dashboard_paginate.dart';
import 'package:staffops/shared/exception/server_exception.dart';

class HomeDatasourceImpl implements HomeDatasource {
  final Dio dio;

  HomeDatasourceImpl(this.dio);

  @override
  Future<DashboardPaginate> getTaskList(FilterQueryParams params) async {
    try {
      final response = await dio.get(
        '/tasks',
        queryParameters: params.toQuery(),
      );

      return DashboardPaginate.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }
}
