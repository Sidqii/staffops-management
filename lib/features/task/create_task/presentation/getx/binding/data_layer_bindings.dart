import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/datasource/create_task_datasource.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/datasource/create_task_datasource_impl.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/repositories/create_task_repository.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/repositories/create_task_repository_impl.dart';

class DataLayerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateTaskDatasource>(() {
      return CreateTaskDatasourceImpl(Get.find<Dio>());
    });

    Get.lazyPut<CreateTaskRepository>(() {
      return CreateTaskRepositoryImpl(Get.find<CreateTaskDatasource>());
    });
  }
}
