import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/repositories/create_task_repository.dart';
import 'package:mini_project_e2e_app/features/task/create_task/domain/usecase/create_task_usecase.dart';
import 'package:mini_project_e2e_app/features/task/create_task/domain/usecase/get_references_of_priority.dart';
import 'package:mini_project_e2e_app/features/task/create_task/domain/usecase/get_references_of_user.dart';

class CreateBindingUsecases extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetReferencesOfUser>(() {
      return GetReferencesOfUser(Get.find<CreateTaskRepository>());
    });

    Get.lazyPut<GetReferencesOfPriority>(() {
      return GetReferencesOfPriority(Get.find<CreateTaskRepository>());
    });

    Get.lazyPut<CreateTaskUsecase>(() {
      return CreateTaskUsecase(Get.find<CreateTaskRepository>());
    });
  }
}