import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffops/features/task/create_task/presentation/widgets/component/upload_files_or_images.dart';
import 'package:staffops/features/task/create_task/presentation/widgets/dialog/date_picker_show_dialog.dart';
import 'package:staffops/features/task/create_task/presentation/widgets/component/calendar_input_field.dart';
import 'package:staffops/features/task/create_task/presentation/widgets/component/custom_dropdown_field.dart';
import 'package:staffops/features/task/update_task/presentation/getx/controller/update_task_controller.dart';
import 'package:staffops/features/task/update_task/presentation/widgets/update_desc_text.dart';
import 'package:staffops/features/task/update_task/presentation/widgets/update_title_text.dart';
import 'package:staffops/features/task/update_task/presentation/widgets/updated_appbar_widget.dart';
import 'package:staffops/shared/entities/task/priority.dart';

class UpdateTaskForm extends GetView<UpdateTaskController> {
  const UpdateTaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpdatedAppbarWidget(),

      bottomNavigationBar: Padding(
        padding: const EdgeInsetsGeometry.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        child: ElevatedButton(
          onPressed: () => controller.onSubmit(controller.task.value!.id),
          child: const Text('Update task'),
        ),
      ),

      body: Obx(() {
        return _contentPanel([
          _contentWrapper([const Text('Title'), const UpdateTitleText()]),

          _contentWrapper([const Text('Description'), const UpdateDescText()]),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _contentWrapper([
                const Text('Priority'),
                CustomDropdownField<Priority>(
                  value: controller.selectedPrio.value,
                  items: controller.prior.toList(),

                  hintText: controller.selectedPrio.value?.name,
                  label: (prior) => _upperCaseLabel(prior.name),

                  onChanged: (value) {
                    if (controller.selectedPrio.value == value) {
                      controller.selectedPrio.value = null;
                    } else {
                      controller.selectedPrio.value = value;
                    }
                  },
                ),
              ]),

              _contentWrapper([
                const Text('Deadline'),
                CalendarInputField(
                  date: controller.selectedDate.value,
                  onTap: () async {
                    final result = await DatePickerShowDialog.show(
                      context,
                      controller.selectedDate.value,
                    );

                    if (result != null) {
                      controller.selectedDate.value = result;
                    }
                  },
                ),
              ]),
            ],
          ),

          _contentWrapper([
            const Text('Assignee task'),

            CustomDropdownField(
              width: MediaQuery.of(context).size.width * 0.9,
              value: controller.selectedUser.value,

              hintText: controller.selectedUser.value?.name,
              items: controller.users.toList(),
              label: (user) => user.name,

              onChanged: (value) {
                if (controller.selectedUser.value == value) {
                  controller.selectedUser.value = null;
                } else {
                  controller.selectedUser.value = value;
                }
              },
            ),
          ]),

          _contentWrapper([
            const Text('Files'),
            UploadFilesOrImages(
              hintText: 'Browse here',
              files: controller.fileItems,
              onTap: controller.pickFiles,
              onRemove: controller.removeFile,
            ),
          ]),
        ]);
      }),
    );
  }

  Widget _contentPanel(List<Widget> child) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: child,
            ),
          ),
        ],
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

  String _upperCaseLabel(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }
}
