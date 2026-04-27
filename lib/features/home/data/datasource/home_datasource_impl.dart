import 'package:dio/dio.dart';
import 'package:mini_project_e2e_app/features/home/data/datasource/home_datasource.dart';
import 'package:mini_project_e2e_app/features/home/data/models/request/filter_query_params.dart';
import 'package:mini_project_e2e_app/features/home/data/models/response/home_pagination.dart';
import 'package:mini_project_e2e_app/shared/exception/server_exception.dart';

class HomeDatasourceImpl implements HomeDatasource {
  final Dio dio;

  HomeDatasourceImpl(this.dio);

  @override
  Future<PaginationResponse> getTaskList(FilterQueryParams params) async {
    try {
      final response = await dio.get(
        '/tasks',
        queryParameters: params.toQuery(),
      );

      return PaginationResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }
}
