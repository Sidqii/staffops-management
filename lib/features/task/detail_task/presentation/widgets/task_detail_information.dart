import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/presentation/getx/controller/task_detail_controller.dart';

class TaskDetailInformation extends GetView<TaskDetailController> {
  const TaskDetailInformation({super.key});

  static const titleStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static const textInformation = TextStyle(fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final task = controller.taskDetail.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Task Information', style: titleStyle),

          const SizedBox(height: 6),

          Row(
            children: [
              Icon(Icons.computer_rounded, size: 12),
              const SizedBox(width: 4),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: task?.assignee ?? '-',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                        text: ' is working on this.',
                        style: textInformation,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          Row(
            children: [
              Icon(Icons.create_rounded, size: 12),
              const SizedBox(width: 4),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Created by ',
                        style: textInformation,
                      ),
                      TextSpan(
                        text: task?.createdBy ?? '-',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Priority level ',
                      style: textInformation,
                    ),
                    TextSpan(
                      text: task?.priority ?? '-',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
