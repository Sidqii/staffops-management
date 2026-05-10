import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:staffops/features/task/delete_task/domain/usecase/delete_task_usecase.dart';
import 'package:staffops/features/task/detail_task/domain/usecase/get_task_detail.dart';
import 'package:staffops/features/task/detail_task/presentation/pages/pdf_viewer_page.dart';
import 'package:staffops/shared/entities/task/task.dart';
import 'package:staffops/shared/exception/server_exception.dart';

class TaskDetailController extends GetxController {
  final Dio dio;
  final GetTaskDetail usecase;
  final DeleteTaskUsecase deleteUsecase;

  TaskDetailController(this.usecase, this.deleteUsecase, this.dio);

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

  Future<void> openFiles({
    required String filePath,
    required String fileName,
  }) async {
    try {
      final dir = await getTemporaryDirectory();

      final file = '${dir.path}/$fileName';
      final path = filePath.replaceFirst('localhost', '127.0.0.1');

      await dio.download(path, file);

      final isPdf = fileName.toLowerCase().endsWith('.pdf');

      if (isPdf) {
        Get.to(() => PdfViewerPage(filePath: file));
      } else {
        final result = await OpenFile.open(file);

        if (result.type != ResultType.done) {
          Get.snackbar('Failed', result.message);
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
