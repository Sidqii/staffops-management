import 'package:dio/src/form_data.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/datasource/create_task_datasource.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/repositories/create_task_repository.dart';
import 'package:mini_project_e2e_app/features/task/create_task/domain/entities/priority_list.dart';
import 'package:mini_project_e2e_app/features/task/create_task/domain/entities/user_list.dart';

class CreateTaskRepositoryImpl implements CreateTaskRepository {
  final CreateTaskDatasource datasource;

  CreateTaskRepositoryImpl(this.datasource);

  @override
  Future<List<UserList>> listOfUser() async {
    final result = await datasource.fetchListOfUsers();

    return result.map((elemet) => elemet.toEntity()).toList();
  }

  @override
  Future<List<PriorityList>> listOfPriority() async {
    final result = await datasource.fetchListOfPriority();

    return result.map((element) => element.toEntity()).toList();
  }

  @override
  Future<void> createTask(FormData formData) async {
    await datasource.createTask(formData);
  }
}
