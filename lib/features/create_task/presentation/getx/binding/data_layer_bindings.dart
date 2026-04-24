import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/create_task/data/datasource/task_datasource.dart';
import 'package:mini_project_e2e_app/features/create_task/data/datasource/task_datasource_impl.dart';
import 'package:mini_project_e2e_app/features/create_task/data/repositories/task_repository.dart';
import 'package:mini_project_e2e_app/features/create_task/data/repositories/task_repository_impl.dart';

class DataLayerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskDatasource>(() {
      return TaskDatasourceImpl(Get.find<Dio>());
    });

    Get.lazyPut<TaskRepository>(() {
      return TaskRepositoryImpl(Get.find<TaskDatasource>());
    });
  }
}