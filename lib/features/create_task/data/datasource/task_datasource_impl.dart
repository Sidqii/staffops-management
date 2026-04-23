import 'package:dio/dio.dart';
import 'package:mini_project_e2e_app/features/create_task/data/datasource/task_datasource.dart';
import 'package:mini_project_e2e_app/features/create_task/data/model/request/create_task_request.dart';
import 'package:mini_project_e2e_app/features/create_task/data/model/response/list_of_priority.dart';
import 'package:mini_project_e2e_app/features/create_task/data/model/response/list_of_user.dart';

class TaskDatasourceImpl implements TaskDatasource {
  final Dio dio;

  TaskDatasourceImpl(this.dio);

  @override
  Future<List<ListOfUser>> fetchListOfUsers() async {
    final response = await dio.get('/users');

    final data = response.data;

    return (data as List).map((e) => ListOfUser.fromJson(e)).toList();
  }

  @override
  Future<List<ListOfPriority>> fetchListOfPriority() async {
    final response = await dio.get('/priority');

    final data = response.data['data'];

    return (data as List).map((e) => ListOfPriority.fromJson(e)).toList();
  }

  @override
  Future<void> createTask(CreateTaskRequest body) async {
    final formData = await body.toFormData();

    await dio.post('/tasks', data: formData);
  }
}
