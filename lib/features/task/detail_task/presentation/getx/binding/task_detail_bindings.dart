import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/data/datasource/detail_task_datasource.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/data/datasource/detail_task_datasource_impl.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/data/repositories/detail_task_repository.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/data/repositories/detail_task_repository_impl.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/domain/usecase/get_task_detail.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/presentation/getx/controller/task_detail_controller.dart';

class TaskDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTaskDatasource>(() {
      return DetailTaskDatasourceImpl(Get.find<Dio>());
    });

    Get.lazyPut<DetailTaskRepository>(() {
      return DetailTaskRepositoryImpl(Get.find<DetailTaskDatasource>());
    });

    Get.lazyPut<GetTaskDetail>(() {
      return GetTaskDetail(Get.find<DetailTaskRepository>());
    });

    Get.lazyPut<TaskDetailController>(() {
      return TaskDetailController(Get.find<GetTaskDetail>());
    });
  }
}
