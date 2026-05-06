import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:staffops/features/task/detail_task/data/datasource/detail_task_datasource.dart';
import 'package:staffops/features/task/detail_task/data/datasource/detail_task_datasource_impl.dart';

import 'package:staffops/features/task/detail_task/data/repositories/detail_task_repository.dart';
import 'package:staffops/features/task/detail_task/data/repositories/detail_task_repository_impl.dart';

import 'package:staffops/features/task/detail_task/domain/usecase/get_task_detail.dart';

import 'package:staffops/features/task/detail_task/presentation/getx/controller/task_detail_controller.dart';

class DetailTaskBindings extends Bindings {
  @override
  void dependencies() {
    // data layer
    Get.lazyPut<DetailTaskDatasource>(() {
      return DetailTaskDatasourceImpl(Get.find<Dio>());
    }, fenix: true);
    Get.lazyPut<DetailTaskRepository>(() {
      return DetailTaskRepositoryImpl(Get.find<DetailTaskDatasource>());
    }, fenix: true);

    // usecase
    Get.lazyPut(
      () => GetTaskDetail(Get.find<DetailTaskRepository>()),
      fenix: true,
    );

    // controller
    Get.lazyPut(() => TaskDetailController(Get.find(), Get.find()));
  }
}
