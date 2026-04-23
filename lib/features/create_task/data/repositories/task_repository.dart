import 'package:mini_project_e2e_app/features/create_task/data/model/request/create_task_request.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/entities/priority_list.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/entities/user_list.dart';

abstract class TaskRepository {
  Future<List<UserList>> listOfUser();

  Future<List<PriorityList>> listOfPriority();

  Future<void> createTask(CreateTaskRequest body);
}
