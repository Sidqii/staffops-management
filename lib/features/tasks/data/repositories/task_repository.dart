import 'package:dio/dio.dart';
import 'package:mini_project_e2e_app/features/tasks/domain/entities/priority_list.dart';
import 'package:mini_project_e2e_app/features/tasks/domain/entities/user_list.dart';

abstract class TaskRepository {
  Future<List<UserList>> listOfUser();

  Future<List<PriorityList>> listOfPriority();

  Future<void> createTask(FormData formData);
}
