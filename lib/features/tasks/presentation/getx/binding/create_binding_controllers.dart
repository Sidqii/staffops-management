import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/tasks/domain/usecase/create_task_usecase.dart';
import 'package:mini_project_e2e_app/features/tasks/domain/usecase/get_references_of_priority.dart';
import 'package:mini_project_e2e_app/features/tasks/domain/usecase/get_references_of_user.dart';
import 'package:mini_project_e2e_app/features/tasks/presentation/getx/controller/create_task_controller.dart';
import 'package:mini_project_e2e_app/features/tasks/presentation/getx/controller/list_of_priority_controller.dart';
import 'package:mini_project_e2e_app/features/tasks/presentation/getx/controller/list_of_user_controller.dart';

class CreateBindingControllers extends Bindings {
  @override
  void dependencies() {
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
