import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffops/features/task/update_task/presentation/getx/controller/update_task_controller.dart';
import 'package:staffops/shared/themes/app_color.dart';

class UpdateTitleText extends GetView<UpdateTaskController> {
  const UpdateTitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.titleController,
      textCapitalization: TextCapitalization.sentences,

      maxLines: null,

      cursorWidth: 1,
      cursorColor: AppColor.grey900,
      cursorErrorColor: AppColor.error,

      decoration: InputDecoration(
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
  }
}
