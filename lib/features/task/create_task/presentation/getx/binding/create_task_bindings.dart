import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:staffops/features/task/create_task/data/datasource/create_task_datasource.dart';
import 'package:staffops/features/task/create_task/data/datasource/create_task_datasource_impl.dart';

import 'package:staffops/features/task/create_task/data/repositories/create_task_repository.dart';
import 'package:staffops/features/task/create_task/data/repositories/create_task_repository_impl.dart';

import 'package:staffops/features/task/create_task/domain/usecase/create_task_usecase.dart';
import 'package:staffops/features/task/create_task/domain/usecase/get_references_of_priority.dart';
import 'package:staffops/features/task/create_task/domain/usecase/get_references_of_user.dart';

import 'package:staffops/features/task/create_task/presentation/getx/controller/create_task_controller.dart';

class CreateTaskBindings extends Bindings {
  @override
  void dependencies() {
    // data layer
    Get.lazyPut<CreateTaskDatasource>(() {
      return CreateTaskDatasourceImpl(Get.find<Dio>());
    });

    Get.lazyPut<CreateTaskRepository>(() {
      return CreateTaskRepositoryImpl(Get.find<CreateTaskDatasource>());
    });

    // usecase
    Get.lazyPut(() => GetReferencesOfUser(Get.find()));
    Get.lazyPut(() => GetReferencesOfPriority(Get.find()));
    Get.lazyPut(() => CreateTaskUsecase(Get.find()));

    // controller
    Get.lazyPut(() => CreateTaskController(Get.find(), Get.find(), Get.find()));
  }
}
