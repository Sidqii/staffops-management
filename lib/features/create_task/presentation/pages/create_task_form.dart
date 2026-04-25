import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/getx/controller/create_task_controller.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/getx/controller/list_of_priority_controller.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/getx/controller/list_of_user_controller.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/widgets/form/calendar_input_field.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/widgets/form/custom_dropdown_field.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/widgets/dialog/date_picker_show_dialog.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/widgets/form/input_desc_text_field.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/widgets/form/input_title_text_field.dart';
import 'package:mini_project_e2e_app/features/create_task/presentation/widgets/form/upload_files_or_images.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class CreateTaskForm extends GetView<CreateTaskController> {
  const CreateTaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    final priorityController = Get.find<ListOfPriorityController>();
    final usersController = Get.find<ListOfUserController>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              _headerContent(),

              _contentWrapper([
                const Text('Title'),
                InputTitleTextField(
                  hintText: controller.hintText,
                  controller: controller.titleController,
                ),
              ]),

              _contentWrapper([
                const Text('Description'),
                InputDescTextField(
                  descText: controller.descText,
                  controller: controller.descsController,
                ),
              ]),

              Row(
                spacing: 20,
                children: [
                  _contentWrapper([
                    const Text('Priority'),
                    Obx(() {
                      return _dorpdownFieldPriority(
                        value: controller.selectedPriority.value,
                        items: priorityController.priorities.toList(),

                        hintText: 'Is this urgent?',
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
                    const Text('Set due date'),
                    GestureDetector(
                      onTap: () async {
                        final result = await DatePickerShowDialog.show(context);

                        if (result != null) {
                          controller.selectedDate(result);
                        }
                      },

                      child: Obx(() {
                        return CalendarInputField(
                          date: controller.selectedDate.value,
                        );
                      }),
                    ),
                  ]),
                ],
              ),

              _contentWrapper([
                const Text('Assigned to'),
                Obx(() {
                  return _dorpdownFieldAssigned(
                    MediaQuery.of(context).size.width * 0.9,
                    value: controller.selectedUser.value,
                    items: usersController.users.toList(),

                    hintText: usersController.hintText,
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

              _contentWrapper([
                const Text('Upload files?'),

                Obx(() {
                  return UploadFilesOrImages(
                    hintText: 'Browse here',
                    files: controller.selectedFiles.toList(),
                    onTap: controller.pickFiles,
                  );
                }),
              ]),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),

                    backgroundColor: AppColor.grey900,
                    foregroundColor: AppColor.softWhite,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  onPressed: controller.onSubmit,

                  child: const Text('Create Task'),
                ),
              ),
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
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 10,
        children: [
          const Icon(Icons.assignment_outlined, color: AppColor.grey600),

          const Text(
            'Define your task',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColor.grey600,
            ),
          ),

          const Spacer(),

          IconButton(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            onPressed: () => Get.back(),

            icon: const Icon(Icons.close_rounded),
          ),
        ],
      ),
    );
  }

  Widget _dorpdownFieldPriority<T>({
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

  Widget _dorpdownFieldAssigned<T>(
    double width, {
    required T? value,
    required List<T> items,
    required String hintText,
    required String Function(T) labelBuilder,
    required Function(T?) onChanged,
  }) {
    return CustomDropdownField<T>(
      value: value,
      width: width,
      items: items,
      hintText: hintText,
      labelBuilder: labelBuilder,
      onChanged: onChanged,
    );
  }
}
