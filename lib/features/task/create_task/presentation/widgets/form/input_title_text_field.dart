import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/getx/controller/create_task_controller.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class InputTitleTextField extends GetView<CreateTaskController> {
  const InputTitleTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextField(
        controller: controller.titleController,
        textCapitalization: TextCapitalization.sentences,

        cursorWidth: 1,
        cursorColor: AppColor.grey900,
        cursorErrorColor: AppColor.error,

        decoration: InputDecoration(
          hintText: controller.hintText,
          errorText: controller.titleError.value,
          hintStyle: TextStyle(color: AppColor.grey600),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColor.grey600),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColor.grey900),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColor.error),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColor.error),
          ),
        ),
      );
    });
  }
}
