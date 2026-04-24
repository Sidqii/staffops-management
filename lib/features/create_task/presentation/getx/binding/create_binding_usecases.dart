import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/create_task/data/repositories/task_repository.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/usecase/create_task_usecase.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/usecase/get_references_of_priority.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/usecase/get_references_of_user.dart';

class CreateBindingUsecases extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetReferencesOfUser>(() {
      return GetReferencesOfUser(Get.find<TaskRepository>());
    });

    Get.lazyPut<GetReferencesOfPriority>(() {
      return GetReferencesOfPriority(Get.find<TaskRepository>());
    });

    Get.lazyPut<CreateTaskUsecase>(() {
      return CreateTaskUsecase(Get.find<TaskRepository>());
    });
  }
}