import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:staffops/config/network/api_config.dart';
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
      // 1. Tentukan lokasi file sementara
      final temporaryDirectory = await getTemporaryDirectory();
      final localFilePath = '${temporaryDirectory.path}/$fileName';

      // 2. Parse base URL aplikasi dan URL file dari backend
      final apiBaseUri = Uri.parse(ApiConfig.defaultUrl);
      final originalFileUri = Uri.parse(filePath);

      // 3. Rekonstruksi URL file agar mengikuti host/scheme/port environment aktif
      final resolvedFileUrl = originalFileUri
          .replace(
            scheme: apiBaseUri.scheme,
            host: apiBaseUri.host,
            port: apiBaseUri.port,
          )
          .toString();

      // 4. Download file ke local temporary storage
      await dio.download(resolvedFileUrl, localFilePath);

      // 5. Tentukan apakah file adalah PDF
      final isPdf = fileName.toLowerCase().endsWith('.pdf');

      // 6. PDF dibuka dengan internal viewer
      if (isPdf) {
        await Get.to(() => PdfViewerPage(filePath: localFilePath));
        return;
      }

      // 7. File selain PDF dibuka menggunakan aplikasi eksternal
      final result = await OpenFile.open(localFilePath);

      if (result.type != ResultType.done) {
        Get.snackbar('Failed', result.message);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
