import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffops/features/task/create_task/presentation/getx/controller/create_task_controller.dart';
import 'package:staffops/shared/themes/app_color.dart';

class InputDescTextField extends GetView<CreateTaskController> {
  const InputDescTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.descsController,
      textCapitalization: TextCapitalization.sentences,

      maxLines: 5,

      cursorWidth: 1,
      cursorColor: AppColor.grey900,
      cursorErrorColor: AppColor.error,

      decoration: InputDecoration(
        hintText: controller.descText,
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
