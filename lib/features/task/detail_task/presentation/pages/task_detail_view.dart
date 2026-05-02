import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/presentation/getx/controller/task_detail_controller.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/presentation/widgets/task_detail_appbar.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/presentation/widgets/task_detail_attachment.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/presentation/widgets/task_detail_header.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/presentation/widgets/task_detail_information.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/presentation/widgets/task_detail_timeline.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class TaskDetailView extends GetView<TaskDetailController> {
  const TaskDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TaskDetailAppbar(),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),

        decoration: BoxDecoration(color: AppColor.softWhite),

        child: const TaskDetailInformation(),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),

          child: Obx(() {
            final task = controller.taskDetail.value;

            if (controller.isLoading.value) {
              return LinearProgressIndicator(
                minHeight: 1,
                color: AppColor.grey900,
              );
            }

            if (task == null) {
              return Center(
                child: GestureDetector(
                  onTap: () => print('retry function (WIP)'),

                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('Failed to load task details. Tap to retry.'),
                  ),
                ),
              );
            }

            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  const TaskDetailHeader(),
                  const SizedBox(height: 20),

                  const TaskDetailAttachment(),
                  const SizedBox(height: 20),

                  const TaskDetailTimeline(),
                  const SizedBox(height: 10),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
