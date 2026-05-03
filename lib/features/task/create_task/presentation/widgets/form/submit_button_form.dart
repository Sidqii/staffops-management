import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffops/features/task/create_task/presentation/getx/controller/create_task_controller.dart';
import 'package:staffops/shared/themes/app_color.dart';

class SubmitButtonForm extends GetView<CreateTaskController> {
  const SubmitButtonForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),

        backgroundColor: AppColor.grey900,
        foregroundColor: AppColor.softWhite,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),

      onPressed: controller.onSubmit,

      child: const Text('Create Task'),
    );
  }
}
