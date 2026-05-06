import 'package:get/get.dart';
import 'package:staffops/features/task/delete_task/domain/usecase/delete_task_usecase.dart';
import 'package:staffops/features/task/detail_task/domain/usecase/get_task_detail.dart';
import 'package:staffops/shared/entities/task/task.dart';
import 'package:staffops/shared/exception/server_exception.dart';

class TaskDetailController extends GetxController {
  final GetTaskDetail usecase;
  final DeleteTaskUsecase deleteUsecase;

  TaskDetailController(this.usecase, this.deleteUsecase);

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

  Future<void> deleteTask(int id) async {
    try {
      await deleteUsecase.execute(id);

      Get.back(result: true);
    } on ServerException catch (e) {
      throw ServerException.fromDio(e);
    }
  }
}
