import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/update_task/data/model/response/updated_task_response.dart';
import 'package:mini_project_e2e_app/features/task/update_task/data/repositories/update_task_repository.dart';

class UpdateTaskController extends GetxController {
  final UpdateTaskRepository repository;

  UpdateTaskController(this.repository);

  Rxn<UpdatedTaskResponse> task = Rxn<UpdatedTaskResponse>();

  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;

    if (args == null || args is! int) {
      return;
    }

    fetchEditingView(args);
  }

  Future<void> fetchEditingView(int id) async {
    isLoading(true);

    try {
      final result = await repository.taskViewEdited(id);

      task.value = result;
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
