import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/domain/entities/task_detail.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/domain/usecase/get_task_detail.dart';

class TaskDetailController extends GetxController {
  final GetTaskDetail usecase;

  TaskDetailController(this.usecase);

  Rxn<TaskDetail> taskDetail = Rxn<TaskDetail>();

  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();

    final int id = Get.arguments;
    fetchTaskDetail(id);
  }

  Future<void> fetchTaskDetail(int id) async {
    isLoading(true);

    try {
        final result = await usecase.execute(id);

        taskDetail.value = result;
    } finally {
      isLoading(false);
    }
  }
}
