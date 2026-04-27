import 'package:dio/dio.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/model/response/list_of_priority.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/model/response/list_of_user.dart';

abstract class CreateTaskDatasource {
  Future<List<ListOfUser>> fetchListOfUsers();

  Future<List<ListOfPriority>> fetchListOfPriority();

  Future<void> createTask(FormData formData);
}
