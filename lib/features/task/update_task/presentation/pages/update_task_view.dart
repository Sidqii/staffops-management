import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/widgets/dialog/date_picker_show_dialog.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/widgets/form/calendar_input_field.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/widgets/form/custom_dropdown_field.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/widgets/form/input_desc_text_field.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/widgets/form/input_title_text_field.dart';
import 'package:mini_project_e2e_app/features/task/update_task/presentation/getx/controller/update_task_controller.dart';
import 'package:mini_project_e2e_app/features/task/update_task/presentation/widgets/updated_appbar_widget.dart';
import 'package:mini_project_e2e_app/shared/entities/task/priority.dart';

class UpdateTaskView extends GetView<UpdateTaskController> {
  const UpdateTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpdatedAppbarWidget(),

      body: Obx(() {
        return _contentPanel([
          _contentWrapper([
            const Text('Title'),

            InputTitleTextField(controller: controller.titleController),
          ]),

          _contentWrapper([
            const Text('Description'),

            InputDescTextField(controller: controller.descsController),
          ]),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _contentWrapper([
                const Text('Priority'),
                CustomDropdownField<Priority>(
                  value: controller.selectedPrio.value,
                  items: controller.priorities.toList(),

                  hintText: controller.selectedPrio.value?.name,
                  label: (prior) => prior.name,

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
                    final result = await DatePickerShowDialog.show(context);

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
              width: MediaQuery.of(context).size.width * 0.9, // fullwidth
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
}
