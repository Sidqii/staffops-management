import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/create_task/data/model/request/create_task_request.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/entities/priority_list.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/entities/some_funny_hints/description_hints.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/entities/some_funny_hints/title_hints.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/entities/user_list.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/usecase/create_task_usecase.dart';
import 'package:mini_project_e2e_app/shared/exception/server_exception.dart';

class CreateTaskController extends GetxController {
  final CreateTaskUsecase usecase;

  CreateTaskController(this.usecase);

  Rxn<DateTime> selectedDate = Rxn<DateTime>();
  Rxn<UserList> selectedUser = Rxn<UserList>();

  Rxn<PriorityList> selectedPriority = Rxn<PriorityList>();
  RxList<PlatformFile> selectedFiles = RxList<PlatformFile>();

  RxBool isLoading = false.obs;

  final title = TitleHints.values;
  final descs = DescriptionHints.values;

  late final String hintText;
  late final String descText;

  @override
  void onInit() {
    super.onInit();
    hintText = title[Random().nextInt(title.length)];
    descText = descs[Random().nextInt(descs.length)];
  }

  Future<void> submitForm(CreateTaskRequest request) async {
    isLoading(true);

    try {
      await usecase.execute(request);

      _successNotification('Task created successfully!');

      Get.back(result: true);
    } on ServerException catch (e) {
      _failedNotification(e.message);
    } catch (e) {
      _errorNotification('Oops! Something went wrong on our end');
    } finally {
      isLoading(false);
    }
  }

  Future<void> pickFiles() async {
    final result = await FilePicker.pickFiles(allowMultiple: true);

    if (result != null) {
      selectedFiles.assignAll(result.files);
    }
  }

  Future<void> removeFiles(PlatformFile file) async {
    selectedFiles.remove(file);
  }

  void _successNotification(String message) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar('Suceess', message);
    }
  }

  void _failedNotification(String message) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar('Failed', message);
    }
  }

  void _errorNotification(String message) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar('Error', message);
    }
  }
}
