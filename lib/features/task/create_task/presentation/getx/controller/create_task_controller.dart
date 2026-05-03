import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:staffops/features/task/create_task/data/model/create_task_request.dart';
import 'package:staffops/features/task/create_task/domain/entities/hint_assignee.dart';
import 'package:staffops/features/task/create_task/domain/entities/hint_description.dart';
import 'package:staffops/features/task/create_task/domain/entities/hint_title.dart';
import 'package:staffops/features/task/create_task/domain/usecase/create_task_usecase.dart';
import 'package:staffops/features/task/create_task/domain/usecase/get_references_of_priority.dart';
import 'package:staffops/features/task/create_task/domain/usecase/get_references_of_user.dart';
import 'package:staffops/features/task/create_task/presentation/utils/form_validator.dart';
import 'package:staffops/features/task/detail_task/data/model/actor/actor_model.dart';
import 'package:staffops/features/task/detail_task/data/model/task/priority_model.dart';
import 'package:staffops/shared/exception/server_exception.dart';

class CreateTaskController extends GetxController {
  final CreateTaskUsecase usecase;
  final GetReferencesOfPriority priorUsecase;
  final GetReferencesOfUser usersUsecase;

  CreateTaskController(this.usecase, this.priorUsecase, this.usersUsecase);

  // load option
  RxList<PriorityModel> prio = <PriorityModel>[].obs;
  RxList<ActorModel> user = <ActorModel>[].obs;

  // controller
  final titleController = TextEditingController();
  final descsController = TextEditingController();

  Rxn<DateTime> selectedDate = Rxn<DateTime>();
  Rxn<ActorModel> selectedUser = Rxn<ActorModel>();

  Rxn<PriorityModel> selectedPriority = Rxn<PriorityModel>();
  RxList<PlatformFile> selectedFiles = RxList<PlatformFile>();

  RxnString titleError = RxnString();
  RxnString userError = RxnString();
  RxnString priorityError = RxnString();
  RxnString dateError = RxnString();

  // flag
  RxBool isLoading = false.obs;

  // hint
  final hintTitle = HintTitle.values;
  final hintDescs = HintDescription.values;
  final hintUsers = HintAssignee.values;

  late final String hintText;
  late final String descText;
  late final String assignee;

  @override
  void onInit() {
    super.onInit();

    loadOption();

    hintText = hintTitle[Random().nextInt(hintTitle.length)];
    descText = hintDescs[Random().nextInt(hintDescs.length)];
    assignee = hintUsers[Random().nextInt(hintUsers.length)];
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
        assignee: user.id,
        deadline: date,
        priority: prio.id,

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

  void loadOption() async {
    prio.value = await priorUsecase.execute();
    user.value = await usersUsecase.execute();
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
