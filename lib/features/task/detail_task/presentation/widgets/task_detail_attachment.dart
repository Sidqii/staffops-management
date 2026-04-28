import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/presentation/getx/controller/task_detail_controller.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class TaskDetailAttachment extends GetView<TaskDetailController> {
  const TaskDetailAttachment({super.key});

  static const titleStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static const attachmentStyle = TextStyle(
    fontSize: 15,
    color: AppColor.grey900,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    final attachment = controller.taskDetail.value?.attachments;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text('Attachment', style: titleStyle),

        Container(
          height: 75,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),

          decoration: BoxDecoration(
            color: AppColor.blueWhale,
            borderRadius: BorderRadius.circular(15),
          ),

          child: ListView.builder(
            shrinkWrap: true,

            itemCount: (attachment == null || attachment.isEmpty)
                ? 1
                : attachment.length,

            itemBuilder: (context, index) {
              if (attachment == null || attachment.isEmpty) {
                return ListTile(
                  // numbering empty file
                  leading: Text((index).toString(), style: attachmentStyle),

                  // text content on empty file
                  title: Text(
                    'No files have been attached yet.',
                    style: attachmentStyle,
                  ),

                  onTap: () {},
                );
              }

              final task = attachment[index];

              return ListTile(
                key: ValueKey(task.id),

                // numbering file index
                leading: Text((index + 1).toString(), style: attachmentStyle),

                // file content
                title: Text(task.fileName, style: attachmentStyle),

                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
