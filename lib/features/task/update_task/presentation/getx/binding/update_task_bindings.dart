import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/update_task/data/datasource/update_task_datasource.dart';
import 'package:mini_project_e2e_app/features/task/update_task/data/datasource/update_task_datasource_impl.dart';
import 'package:mini_project_e2e_app/features/task/update_task/data/repositories/update_task_repository.dart';
import 'package:mini_project_e2e_app/features/task/update_task/domain/usecase/prio_list_usecase.dart';
import 'package:mini_project_e2e_app/features/task/update_task/domain/usecase/user_list_usecase.dart';
import 'package:mini_project_e2e_app/features/task/update_task/presentation/getx/controller/update_task_controller.dart';

class UpdateTaskBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateTaskDatasource>(() {
      return UpdateTaskDatasourceImpl(Get.find());
    });

    Get.lazyPut<UpdateTaskRepository>(() {
      return UpdateTaskRepositoryImpl(Get.find());
    });

    Get.lazyPut<PrioListUsecase>(() {
      return PrioListUsecase(Get.find());
    });

    Get.lazyPut<UserListUsecase>(() {
      return UserListUsecase(Get.find());
    });

    Get.lazyPut(() {
      return UpdateTaskController(Get.find(), Get.find(), Get.find());
    });
  }
}
