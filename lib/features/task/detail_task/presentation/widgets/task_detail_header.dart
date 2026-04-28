import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/presentation/getx/controller/task_detail_controller.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class TaskDetailHeader extends GetView<TaskDetailController> {
  const TaskDetailHeader({super.key});

  static const titleStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static const taskTitleStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w200,
  );

  static const descTitleStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
  );

  @override
  Widget build(BuildContext context) {
    final task = controller.taskDetail.value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            // task header
            Text('Task', style: titleStyle),

            // status banner
            _bannerStatusContainer(task?.status ?? ''),
          ],
        ),

        // task content
        Text(task?.title ?? '', style: taskTitleStyle),

        const SizedBox(height: 10),

        // description header
        Text(
          task?.description != null
              ? 'What needs to be done'
              : 'No description has been added yet!',
          style: titleStyle,
        ),

        const SizedBox(height: 5),

        // description content
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            task?.description ?? 'Nothing here yet… no clues so far',
            style: descTitleStyle,
          ),
        ),
      ],
    );
  }

  Color _statusColor(String? status) {
    switch (status) {
      case 'completed':
        return AppColor.success;
      case 'in_progress':
        return AppColor.blueTiran;
      default:
        return AppColor.grey900;
    }
  }

  Widget _bannerStatusContainer(String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _statusColor(value).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        value,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: _statusColor(value),
        ),
      ),
    );
  }
}
