import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffops/features/task/detail_task/presentation/getx/controller/task_detail_controller.dart';
import 'package:staffops/shared/entities/task/attachment.dart';
import 'package:staffops/shared/themes/app_color.dart';

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

  static const attachmentEmpty = TextStyle(
    fontSize: 15,
    color: AppColor.grey900,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    final attachment = controller.taskDetail.value?.attachment;
    final isNull = (attachment == null || attachment.isEmpty);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: '${attachment?.length.toString() ?? 0}'),

              TextSpan(text: ' Attachments', style: titleStyle),
            ],
          ),
        ),

        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),

          itemCount: isNull ? 1 : attachment.length,

          itemBuilder: (context, index) {
            if (isNull) {
              return _emptyFiles();
            }

            return _attachmentList(attachment[index]);
          },
        ),
      ],
    );
  }

  Widget _emptyFiles() {
    return ListTile(
      contentPadding: EdgeInsets.zero,

      leading: Icon(Icons.folder_outlined),
      title: Text('No attachment included', style: attachmentEmpty),
    );
  }

  Widget _attachmentList(Attachment attachment) {
    return ListTile(
      key: ValueKey(attachment.id),

      contentPadding: EdgeInsets.zero,

      leading: _setIcon(attachment),
      title: Text(attachment.fileName, style: attachmentStyle),

      onTap: () {
        // TODO: open files feature
      },
    );
  }

  Icon _setIcon(Attachment attachment) {
    final ext = attachment.fileName.split('.').last.toLowerCase();

    if (['jpg', 'png'].contains(ext)) {
      return Icon(Icons.image);
    }

    if (ext == 'pdf') {
      return Icon(Icons.picture_as_pdf);
    }

    if (['doc', 'docx'].contains(ext)) {
      return Icon(Icons.description);
    }

    return Icon(Icons.insert_drive_file);
  }
}
