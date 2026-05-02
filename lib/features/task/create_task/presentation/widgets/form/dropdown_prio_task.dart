import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/getx/controller/create_task_controller.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/widgets/component/custom_dropdown_field.dart';

class DropdownPrioTask extends GetView<CreateTaskController> {
  const DropdownPrioTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CustomDropdownField(
        value: controller.selectedPriority.value,
        error: controller.priorityError.value,

        items: controller.prio.toList(),
        label: (prio) => _upperCaseLabel(prio.name),

        hintText: 'Priority level',
        onChanged: (value) {
          if (controller.selectedPriority.value == value) {
            controller.selectedPriority.value = null;
          } else {
            controller.selectedPriority.value = value;
          }
        },
      );
    });
  }

  String _upperCaseLabel(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }
}
