import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffops/features/task/create_task/presentation/getx/controller/create_task_controller.dart';
import 'package:staffops/features/task/create_task/presentation/widgets/form/app_bar_create_task.dart';
import 'package:staffops/features/task/create_task/presentation/widgets/form/dropdown_prio_task.dart';
import 'package:staffops/features/task/create_task/presentation/widgets/form/dropdown_user_task.dart';
import 'package:staffops/features/task/create_task/presentation/widgets/form/input_calendar_field.dart';
import 'package:staffops/features/task/create_task/presentation/widgets/form/submit_button_form.dart';
import 'package:staffops/features/task/create_task/presentation/widgets/form/input_desc_text_field.dart';
import 'package:staffops/features/task/create_task/presentation/widgets/form/input_title_text_field.dart';
import 'package:staffops/features/task/create_task/presentation/widgets/component/upload_files_or_images.dart';
import 'package:staffops/shared/themes/app_color.dart';

class CreateTaskForm extends GetView<CreateTaskController> {
  const CreateTaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCreateTask(),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: const SubmitButtonForm(),
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
                  // title task
                  _contentWrapper([
                    const Text('Title'),
                    const InputTitleTextField(),
                  ]),

                  // description task
                  _contentWrapper([
                    const Text('Description?'),
                    const InputDescTextField(),
                  ]),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // selected priority (level)
                      _contentWrapper([
                        const Text('Priority'),
                        const DropdownPrioTask(),
                      ]),

                      // selected deadline
                      _contentWrapper([
                        const Text('Set due date'),
                        const InputCalendarField(),
                      ]),
                    ],
                  ),

                  // task assigned to
                  _contentWrapper([
                    const Text('Assigned to'),
                    const DropdownUserTask(),
                  ]),

                  // updload file or image (WIP)
                  _contentWrapper([
                    const Text('Upload files?'),
                    UploadFilesOrImages(
                      hintText: 'Browse here',
                      files: controller.selectedFiles.toList(),
                      onTap: controller.pickFiles,
                    ),
                  ]),

                  const SizedBox(height: 10),
                ],
              ),
            ),

            // loading indicator
            Obx(() {
              if (!controller.isLoading.value) {
                return const SizedBox.shrink();
              }

              return Container(
                color: AppColor.softWhite.withValues(alpha: 0.3),
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

  // wrapper widget with column
  Widget _contentWrapper(List<Widget> child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: child,
    );
  }
}
