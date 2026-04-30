import 'package:dio/src/form_data.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/datasource/create_task_datasource.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/model/response/priority_response.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/model/response/user_response.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/repositories/create_task_repository.dart';

class CreateTaskRepositoryImpl implements CreateTaskRepository {
  final CreateTaskDatasource datasource;

  CreateTaskRepositoryImpl(this.datasource);

  @override
  Future<List<UserResponse>> listOfUser() async {
    return await datasource.fetchListOfUsers();
  }

  @override
  Future<List<PriorityResponse>> listOfPriority() async {
    return await datasource.fetchListOfPriority();
  }

  @override
  Future<void> createTask(FormData formData) async {
    await datasource.createTask(formData);
  }
}
