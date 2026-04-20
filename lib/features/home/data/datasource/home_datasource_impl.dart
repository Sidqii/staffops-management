import 'package:dio/dio.dart';
import 'package:mini_project_e2e_app/features/home/data/datasource/home_datasource.dart';
import 'package:mini_project_e2e_app/features/home/data/models/request/task_query_params.dart';
import 'package:mini_project_e2e_app/features/home/data/models/response/pagination_response.dart';

class HomeDatasourceImpl implements HomeDatasource {
  final Dio dio;

  HomeDatasourceImpl(this.dio);

  @override
  Future<PaginationResponse> getTaskList(TaskQueryParams params) async {
    final response = await dio.get('/tasks', queryParameters: params.toQuery());

    return PaginationResponse.fromJson(response.data);
  }
}