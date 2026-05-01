import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/presentation/getx/controller/task_detail_controller.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

typedef Controller = GetView<TaskDetailController>;

class TaskDetailAppbar extends Controller implements PreferredSizeWidget {
  const TaskDetailAppbar({super.key});

  static const titleAppbar = TextStyle(
    color: AppColor.grey900,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () => Get.back(),
      ),

      title: Obx(() {
        final title = controller.taskDetail.value?.title;

        return Text(
          title ?? 'Task Detail',
          overflow: TextOverflow.ellipsis,

          style: titleAppbar,
        );
      }),

      actions: [
        IconButton(
          icon: const Icon(Icons.edit_outlined),
          color: AppColor.grey900,

          onPressed: () {
            Get.toNamed(
              '/task/update',
              arguments: controller.taskDetail.value,
            );
          },
        ),

        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),

          onSelected: (value) {
            switch (value) {
              case 'delete':
                // TODO: delete logic
                break;
            }
          },

          itemBuilder: (context) => [
            const PopupMenuItem(value: 'delete', child: Text('Delete Task')),
          ],
        ),
      ],
    );
  }
}
