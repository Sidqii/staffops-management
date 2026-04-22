import 'dart:math';

import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/data/model/request/create_task_request.dart';
import 'package:mini_project_e2e_app/features/task/domain/usecase/create_task_usecase.dart';
import 'package:mini_project_e2e_app/shared/exception/server_exception.dart';

class CreateTaskController extends GetxController {
  final CreateTaskUsecase usecase;

  CreateTaskController(this.usecase);

  RxBool isLoading = false.obs;

  final selectedUserId = Rxn<int>();

  final users = [
    {'id': 1, 'name': 'John Doe'},
    {'id': 2, 'name': 'Jane Smith'},
    {'id': 3, 'name': 'Alex Johnson'},
  ];

  final hints = [
    "e.g. fix-auth-bug-before-coffee ☕",
    "e.g. works-on-my-machine 🧠",
    "e.g. task-tracker-api",
    "e.g. update-user-profile-feature",
    "e.g. improve-login-experience",
    "e.g. add-payment-method",
    "e.g. fix-notification-issue",
    "e.g. optimize-loading-time ⚡",
    "e.g. redesign-homepage-ui 🎨",
    "e.g. sync-data-with-server",
    "e.g. handle-error-gracefully",
    "e.g. enhance-search-function",
    "e.g. clean-up-unused-code 🧹",
  ];

  final descs = [
    "Describe what needs to be done...",
    "Explain the task so future you won't be confused 🤔",
    "What’s the goal of this task?",
    "Add details, steps, or notes here...",
    "Why does this task exist? 👀",
    "Give context so your team understands",
  ];

  late final String hintText;
  late final String descText;

  @override
  void onInit() {
    super.onInit();
    hintText = hints[Random().nextInt(hints.length)];
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
