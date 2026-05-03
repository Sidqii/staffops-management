import 'package:get/get.dart';
import 'package:staffops/features/task/detail_task/domain/usecase/get_task_detail.dart';
import 'package:staffops/shared/entities/task/task.dart';

class TaskDetailController extends GetxController {
  final GetTaskDetail usecase;

  TaskDetailController(this.usecase);

  Rxn<Task> taskDetail = Rxn<Task>();

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
      taskDetail.value = await usecase.execute(id);
    } finally {
      isLoading(false);
    }
  }

  Future<void> refresh() async {
    isLoading(true);

    try {
      await fetchTaskDetail(Get.arguments);
    } finally {
      isLoading(false);
    }
  }
}
