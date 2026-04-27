import 'package:dio/dio.dart';
import 'package:mini_project_e2e_app/features/task/create_task/domain/entities/priority_list.dart';
import 'package:mini_project_e2e_app/features/task/create_task/domain/entities/user_list.dart';

abstract class CreateTaskRepository {
  Future<List<UserList>> listOfUser();

  Future<List<PriorityList>> listOfPriority();

  Future<void> createTask(FormData formData);
}
