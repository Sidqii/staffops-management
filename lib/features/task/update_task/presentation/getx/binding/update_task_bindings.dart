import 'package:get/get.dart';
import 'package:staffops/features/task/update_task/data/datasource/update_task_datasource.dart';
import 'package:staffops/features/task/update_task/data/datasource/update_task_datasource_impl.dart';
import 'package:staffops/features/task/update_task/data/repositories/update_task_repository.dart';
import 'package:staffops/features/task/update_task/domain/usecase/prio_list_usecase.dart';
import 'package:staffops/features/task/update_task/domain/usecase/task_update_usecase.dart';
import 'package:staffops/features/task/update_task/domain/usecase/user_list_usecase.dart';
import 'package:staffops/features/task/update_task/presentation/getx/controller/update_task_controller.dart';

class UpdateTaskBindings extends Bindings {
  @override
  void dependencies() {
    // data layer
    Get.lazyPut<UpdateTaskDatasource>(() {
      return UpdateTaskDatasourceImpl(Get.find());
    });
    Get.lazyPut<UpdateTaskRepository>(() {
      return UpdateTaskRepositoryImpl(Get.find());
    });

    // usecase
    Get.lazyPut(() => PrioListUsecase(Get.find()));
    Get.lazyPut(() => UserListUsecase(Get.find()));
    Get.lazyPut(() => TaskUpdateUsecase(Get.find()));

    // controller
    Get.lazyPut(() {
      return UpdateTaskController(
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
      );
    });
  }
}
