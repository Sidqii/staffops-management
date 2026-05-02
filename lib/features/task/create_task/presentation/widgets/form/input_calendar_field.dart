import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/getx/controller/create_task_controller.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/widgets/component/calendar_input_field.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/widgets/dialog/date_picker_show_dialog.dart';

class InputCalendarField extends GetView<CreateTaskController> {
  const InputCalendarField({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CalendarInputField(
        date: controller.selectedDate.value,

        error: controller.dateError.value,

        onTap: () async {
          final result = await DatePickerShowDialog.show(
            context,
            controller.selectedDate.value,
          );

          if (result != null) {
            controller.selectedDate.value = result;
          }
        },
      );
    });
  }
}
