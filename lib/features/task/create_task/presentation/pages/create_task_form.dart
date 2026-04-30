import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/getx/controller/create_task_controller.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/getx/controller/list_of_priority_controller.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/getx/controller/list_of_user_controller.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/widgets/app_bar_create_task.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/widgets/form/calendar_input_field.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/widgets/form/create_submit_button.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/widgets/form/custom_dropdown_field.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/widgets/dialog/date_picker_show_dialog.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/widgets/form/input_desc_text_field.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/widgets/form/input_title_text_field.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/widgets/form/upload_files_or_images.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class CreateTaskForm extends GetView<CreateTaskController> {
  const CreateTaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    final priorController = Get.find<ListOfPriorityController>();
    final usersController = Get.find<ListOfUserController>();

    return Scaffold(
      appBar: const AppBarCreateTask(),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Obx(() {
          return CreateSubmitButton(
            isLoading: controller.isLoading.value,
            onPressed: controller.onSubmit,
          );
        }),
      ),

      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  _contentWrapper([
                    const Text('Title'),
                    Obx(() {
                      return InputTitleTextField(
                        hintText: controller.hintText,
                        errorText: controller.titleError.value,
                        controller: controller.titleController,
                      );
                    }),
                  ]),

                  _contentWrapper([
                    const Text('Description?'),
                    InputDescTextField(
                      descText: controller.descText,
                      controller: controller.descsController,
                    ),
                  ]),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _contentWrapper([
                        const Text('Priority'),
                        Obx(() {
                          return _dorpdownFieldPriority(
                            value: controller.selectedPriority.value,
                            items: priorController.priorities.toList(),

                            hintText: 'Is this urgent?',
                            errorText: controller.priorityError.value,

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

                        Obx(() {
                          return CalendarInputField(
                            date: controller.selectedDate.value,
                            errorText: controller.dateError.value,

                            onTap: () async {
                              final result = await DatePickerShowDialog.show(
                                context,
                              );

                              if (result != null) {
                                controller.selectedDate(result);
                              }
                            },
                          );
                        }),
                      ]),
                    ],
                  ),

                  _contentWrapper([
                    const Text('Assigned to'),
                    Obx(() {
                      return _dorpdownFieldAssigned(
                        MediaQuery.of(context).size.width * 0.9, // fullwidth
                        value: controller.selectedUser.value,
                        items: usersController.users.toList(),

                        hintText: usersController.hintText,
                        errorText: controller.userError.value,

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
                ],
              ),
            ),

            Obx(() {
              if (!controller.isLoading.value) {
                return const SizedBox.shrink();
              }

              return Container(
                color: AppColor.grey600.withValues(alpha: 0.2),
                child: const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                    color: AppColor.grey900,
                  ),
                ),
              );
            }),
          ],
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

  Widget _dorpdownFieldPriority<T>({
    required T? value,
    required List<T> items,
    required String hintText,
    required String Function(T) labelBuilder,
    required Function(T?) onChanged,
    String? errorText,
  }) {
    return CustomDropdownField<T>(
      value: value,
      items: items,
      hintText: hintText,
      labelBuilder: labelBuilder,
      onChanged: onChanged,
      errorText: errorText,
    );
  }

  Widget _dorpdownFieldAssigned<T>(
    double width, {
    required T? value,
    required List<T> items,
    required String hintText,
    required String Function(T) labelBuilder,
    required Function(T?) onChanged,
    String? errorText,
  }) {
    return CustomDropdownField<T>(
      value: value,
      width: width,
      items: items,
      hintText: hintText,
      labelBuilder: labelBuilder,
      onChanged: onChanged,
      errorText: errorText,
    );
  }
}
