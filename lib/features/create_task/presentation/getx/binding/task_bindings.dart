import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/create_task/data/datasource/task_datasource.dart';
import 'package:mini_project_e2e_app/features/create_task/data/datasource/task_datasource_impl.dart';
import 'package:mini_project_e2e_app/features/create_task/data/repositories/task_repository.dart';
import 'package:mini_project_e2e_app/features/create_task/data/repositories/task_repository_impl.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/usecase/create_task_usecase.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/usecase/get_references_of_priority.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/usecase/get_references_of_user.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/getx/controller/create_task_controller.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/getx/controller/list_of_priority_controller.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/getx/controller/list_of_user_controller.dart';

class TaskBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskDatasource>(() {
      return TaskDatasourceImpl(Get.find<Dio>());
    });

    Get.lazyPut<TaskRepository>(() {
      return TaskRepositoryImpl(Get.find<TaskDatasource>());
    });

    Get.lazyPut<GetReferencesOfUser>(() {
      return GetReferencesOfUser(Get.find<TaskRepository>());
    });

    Get.lazyPut<GetReferencesOfPriority>(() {
      return GetReferencesOfPriority(Get.find<TaskRepository>());
    });

    Get.lazyPut<CreateTaskUsecase>(() {
      return CreateTaskUsecase(Get.find<TaskRepository>());
    });

    Get.lazyPut<ListOfUserController>(() {
      return ListOfUserController(Get.find<GetReferencesOfUser>());
    });

    Get.lazyPut<ListOfPriorityController>(() {
      return ListOfPriorityController(Get.find<GetReferencesOfPriority>());
    });

    Get.lazyPut<CreateTaskController>(() {
      return CreateTaskController(Get.find<CreateTaskUsecase>());
    });
  }
}
