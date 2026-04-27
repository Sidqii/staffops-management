import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/presentation/getx/controller/task_detail_controller.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/presentation/widgets/timeline_data.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class TaskDetailView extends GetView<TaskDetailController> {
  const TaskDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greenPalm,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _buildReactiveTimeline(),
        ),
      ),
    );
  }

  Widget _buildReactiveTimeline() {
    return Obx(() {
      final started = controller.taskDetail.value?.timeline?.startedAt;
      final completed = controller.taskDetail.value?.timeline?.completedAt;

      return _buildTimelineSection(started, completed);
    });
  }

  Widget _buildTimelineSection(String? started, String? completed) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        TimelineData(
          title: 'Started at',
          date: started != null
              ? 'Ongoing at ${formatDate(started)}'
              : 'This task hasn’t started yet',
          isFirst: true,
          isLast: false,
          isDone: started != null,
        ),

        TimelineData(
          title: 'Completed at',
          date: completed != null
              ? 'Completed at ${formatDate(completed)}'
              : 'This task hasn’t been completed yet',
          isFirst: false,
          isLast: true,
          isDone: completed != null,
        ),
      ],
    );
  }

  String formatDate(String? value) {
    if (value == null || value.isEmpty) {
      return '...';
    }

    try {
      final dateTime = DateTime.parse(value).toLocal();

      return DateFormat('dd MMM yyyy').format(dateTime);
    } catch (e) {
      return '...';
    }
  }
}
