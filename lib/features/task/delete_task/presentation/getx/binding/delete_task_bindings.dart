import 'package:get/get.dart';
import 'package:staffops/features/task/delete_task/data/datasource/delete_task_datasource.dart';
import 'package:staffops/features/task/delete_task/data/repositories/delete_task_repository.dart';
import 'package:staffops/features/task/delete_task/domain/usecase/delete_task_usecase.dart';

class DeleteTaskBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeleteTaskDatasource>(() {
      return DeleteTaskDatasourceImpl(Get.find());
    });

    Get.lazyPut<DeleteTaskRepository>(() {
      return DeleteTaskRepsitoryImpl(Get.find());
    });

    Get.lazyPut(() => DeleteTaskUsecase(Get.find()));
  }
}
