import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/getx/controller/create_task_controller.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/getx/controller/list_of_priority_controller.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/widgets/form/custom_dropdown_field.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/widgets/form/input_desc_text_field.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/widgets/form/input_title_text_field.dart';

class CreateTaskForm extends GetView<CreateTaskController> {
  const CreateTaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    final priorityController = Get.find<ListOfPriorityController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
              _headerContent(),

              _contentWrapper([
                Text('Title'),
                InputTitleTextField(hintText: controller.hintText),
              ]),

              _contentWrapper([
                Text('Description'),
                InputDescTextField(descText: controller.descText),
              ]),

              _contentWrapper([
                Text('Priority'),
                _priorityDropdownMenu(
                  priorityController.priority.toList(),
                  priorityController.hintText,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentWrapper(List<Widget> child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: child,
    );
  }

  Widget _headerContent() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 10,
        children: [
          Icon(Icons.assignment_outlined),

          Text(
            'Define your task',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          Spacer(),

          IconButton(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            onPressed: () => Get.back(),

            icon: Icon(Icons.close_rounded),
          ),
        ],
      ),
    );
  }

  Widget _priorityDropdownMenu(List items, String hintText) {
    return Obx(() {
      return CustomDropdownField(
        value: controller.selectedPriority.value,
        items: items,

        hintText: hintText,

        labelBuilder: (priority) {
          final name = priority.name;

          return name[0].toUpperCase() + name.substring(1);
        },

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
}
