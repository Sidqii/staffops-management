import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/update_task/data/repositories/update_task_repository.dart';
import 'package:mini_project_e2e_app/features/task/update_task/domain/usecase/prio_list_usecase.dart';
import 'package:mini_project_e2e_app/features/task/update_task/domain/usecase/user_list_usecase.dart';
import 'package:mini_project_e2e_app/shared/entities/task/priority.dart';
import 'package:mini_project_e2e_app/shared/entities/task/task.dart';
import 'package:mini_project_e2e_app/shared/entities/user/user.dart';

class UpdateTaskController extends GetxController {
  final UpdateTaskRepository repository;
  final PrioListUsecase prioList;
  final UserListUsecase userList;

  UpdateTaskController(this.repository, this.prioList, this.userList);

  Rxn<Task> task = Rxn<Task>();

  final titleController = TextEditingController();
  final descsController = TextEditingController();

  Rxn<User> selectedUser = Rxn<User>();
  Rxn<Priority> selectedPrio = Rxn<Priority>();
  Rxn<DateTime> selectedDate = Rxn<DateTime>();

  RxList<Priority> priorities = <Priority>[].obs;
  RxList<User> users = <User>[].obs;

  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;

    _prefillView(args);
    loadOption();
  }

  void _prefillView(Task data) {
    task.value = data;

    titleController.text = data.title;
    descsController.text = data.description ?? '';

    selectedPrio.value = data.priority;
    selectedUser.value = data.assignee;

    selectedDate.value = data.deadline;
  }

  void loadOption() async {
    priorities.value = await prioList.execute();
    users.value = await userList.execute();
  }

  @override
  void onClose() {
    super.onClose();

    titleController.dispose();
    descsController.dispose();
  }
}
