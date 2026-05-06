import 'package:dio/src/form_data.dart';
import 'package:staffops/features/auth/data/models/response/user_model.dart';
import 'package:staffops/features/task/create_task/data/datasource/create_task_datasource.dart';
import 'package:staffops/features/task/create_task/data/repositories/create_task_repository.dart';
import 'package:staffops/features/task/detail_task/data/model/task/priority_model.dart';

class CreateTaskRepositoryImpl implements CreateTaskRepository {
  final CreateTaskDatasource datasource;

  CreateTaskRepositoryImpl(this.datasource);

  @override
  Future<List<UserModel>> listOfUser() async {
    return await datasource.fetchListOfUsers();
  }

  @override
  Future<List<PriorityModel>> listOfPriority() async {
    return await datasource.fetchListOfPriority();
  }

  @override
  Future<void> createTask(FormData formData) async {
    await datasource.createTask(formData);
  }
}
