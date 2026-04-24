import 'package:dio/src/form_data.dart';
import 'package:mini_project_e2e_app/features/create_task/data/datasource/task_datasource.dart';
import 'package:mini_project_e2e_app/features/create_task/data/repositories/task_repository.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/entities/priority_list.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/entities/user_list.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDatasource datasource;

  TaskRepositoryImpl(this.datasource);

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
