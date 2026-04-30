import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/update_task/presentation/getx/controller/update_task_controller.dart';

class UpdateTaskView extends GetView<UpdateTaskController> {
  const UpdateTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              Text(controller.task.value?.title ?? ''),

              Text(controller.task.value?.description ?? ''),

              Text(controller.task.value?.assignee.name ?? ''),

              Text(controller.task.value?.priority.name ?? ''),
            ],
          );
        }),
      ),
    );
  }
}
