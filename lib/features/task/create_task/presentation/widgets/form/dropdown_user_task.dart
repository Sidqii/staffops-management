import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffops/features/task/create_task/presentation/getx/controller/create_task_controller.dart';
import 'package:staffops/features/task/create_task/presentation/widgets/component/custom_dropdown_field.dart';

class DropdownUserTask extends GetView<CreateTaskController> {
  const DropdownUserTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CustomDropdownField(
        width: MediaQuery.of(context).size.width * 0.9,
        value: controller.selectedUser.value,

        items: controller.user.toList(),
        label: (user) => user.name,

        error: controller.userError.value,
        hintText: controller.assignee,

        onChanged: (value) {
          if (controller.selectedUser.value == value) {
            controller.selectedUser.value = null;
          } else {
            controller.selectedUser.value = value;
          }
        },
      );
    });
  }
}
