import 'package:dio/dio.dart';
import 'package:mini_project_e2e_app/features/tasks/data/model/response/list_of_priority.dart';
import 'package:mini_project_e2e_app/features/tasks/data/model/response/list_of_user.dart';

abstract class TaskDatasource {
  Future<List<ListOfUser>> fetchListOfUsers();

  Future<List<ListOfPriority>> fetchListOfPriority();

  Future<void> createTask(FormData formData);
}
