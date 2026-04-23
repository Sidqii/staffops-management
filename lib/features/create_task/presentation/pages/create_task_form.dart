import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/getx/controller/create_task_controller.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/getx/controller/list_of_priority_controller.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/getx/controller/list_of_user_controller.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/widgets/form/custom_dropdown_field.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/widgets/form/input_desc_text_field.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/widgets/form/input_title_text_field.dart';

class CreateTaskForm extends GetView<CreateTaskController> {
  const CreateTaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    final priorityController = Get.find<ListOfPriorityController>();
    final usersController = Get.find<ListOfUserController>();

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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _contentWrapper([
                    Text('Priority'),
                    Obx(() {
                      return _dorpdownField(
                        value: controller.selectedPriority.value,
                        items: priorityController.priorities.toList(),
                        hintText: priorityController.hintText,
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
                    }),
                  ]),

                  _contentWrapper([
                    Text('Assigned to'),
                    Obx(() {
                      return _dorpdownField(
                        value: controller.selectedUser.value,
                        items: usersController.users.toList(),
                        hintText: 'Assigned to ...',
                        labelBuilder: (user) => user.name,
                        onChanged: (value) {
                          if (controller.selectedUser.value == value) {
                            controller.selectedUser.value = null;
                          } else {
                            controller.selectedUser.value = value;
                          }
                        },
                      );
                    }),
                  ]),
                ],
              ),

              // TODO: implement upload file here & add scrollChild
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

  Widget _dorpdownField<T>({
    required T? value,
    required List<T> items,
    required String hintText,
    required String Function(T) labelBuilder,
    required Function(T?) onChanged,
  }) {
    return CustomDropdownField<T>(
      value: value,
      items: items,
      hintText: hintText,
      labelBuilder: labelBuilder,
      onChanged: onChanged,
    );
  }
}
