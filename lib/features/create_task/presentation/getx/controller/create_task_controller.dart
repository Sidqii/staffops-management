import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/create_task/data/model/request/create_task_request.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/entities/priority_list.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/entities/some_funny_hints/description_hints.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/entities/some_funny_hints/title_hints.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/entities/user_list.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/usecase/create_task_usecase.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/utils/form_validator.dart';
import 'package:mini_project_e2e_app/shared/exception/server_exception.dart';

class CreateTaskController extends GetxController {
  final CreateTaskUsecase usecase;

  CreateTaskController(this.usecase);

  final titleController = TextEditingController();
  final descsController = TextEditingController();

  Rxn<DateTime> selectedDate = Rxn<DateTime>();
  Rxn<UserList> selectedUser = Rxn<UserList>();

  Rxn<PriorityList> selectedPriority = Rxn<PriorityList>();
  RxList<PlatformFile> selectedFiles = RxList<PlatformFile>();

  RxnString titleError = RxnString();
  RxnString userError = RxnString();
  RxnString priorityError = RxnString();
  RxnString dateError = RxnString();

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

  Future<void> onSubmit() async {
    if (!validateForm()) return;

    try {
      final user = selectedUser.value!;
      final prio = selectedPriority.value!;
      final date = selectedDate.value!;

      final request = CreateTaskRequest(
        title: titleController.text,
        description: descsController.text,
        assignedTo: user.id,
        dueDate: date,
        priorityId: prio.id,

        filePath: selectedFiles.map((element) {
          return element.path!;
        }).toList(),
      );

      await submitForm(request);
    } on ServerException catch (e) {
      _failedNotification(e.message);
    }
  }

  bool validateForm() {
    bool isValid = true;

    titleError.value = null;
    userError.value = null;
    priorityError.value = null;
    dateError.value = null;

    titleError.value = FormValidator.validateTitle(titleController.text);

    userError.value = FormValidator.validateUser(selectedUser.value);

    priorityError.value = FormValidator.validatePriority(
      selectedPriority.value,
    );

    dateError.value = FormValidator.validateDate(selectedDate.value);

    if (titleError.value != null) isValid = false;
    if (userError.value != null) isValid = false;
    if (priorityError.value != null) isValid = false;
    if (dateError.value != null) isValid = false;

    return isValid;
  }

  Future<void> submitForm(CreateTaskRequest request) async {
    isLoading(true);

    try {
      await usecase.execute(request);

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
