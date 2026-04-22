import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/data/datasource/task_datasource.dart';
import 'package:mini_project_e2e_app/features/task/data/datasource/task_datasource_impl.dart';
import 'package:mini_project_e2e_app/features/task/data/repositories/task_repository.dart';
import 'package:mini_project_e2e_app/features/task/data/repositories/task_repository_impl.dart';
import 'package:mini_project_e2e_app/features/task/domain/usecase/create_task_usecase.dart';
import 'package:mini_project_e2e_app/features/task/presentation/getx/controller/create_task_controller.dart';

class TaskBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskDatasource>(() {
      return TaskDatasourceImpl(Get.find<Dio>());
    });

    Get.lazyPut<TaskRepository>(() {
      return TaskRepositoryImpl(Get.find<TaskDatasource>());
    });

    Get.lazyPut<CreateTaskUsecase>(() {
      return CreateTaskUsecase(Get.find<TaskRepository>());
    });

    Get.lazyPut<CreateTaskController>(() {
      return CreateTaskController(Get.find<CreateTaskUsecase>());
    });
  }
}
