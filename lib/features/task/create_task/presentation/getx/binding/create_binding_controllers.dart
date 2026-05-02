import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/getx/controller/create_task_controller.dart';

class CreateBindingControllers extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateTaskController>(() {
      return CreateTaskController(Get.find(), Get.find(), Get.find());
    });
  }
}
