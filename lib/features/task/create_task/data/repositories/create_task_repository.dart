import 'package:dio/dio.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/model/response/priority_response.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/model/response/user_response.dart';

abstract class CreateTaskRepository {
  Future<List<UserResponse>> listOfUser();

  Future<List<PriorityResponse>> listOfPriority();

  Future<void> createTask(FormData formData);
}
