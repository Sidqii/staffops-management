import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/presentation/getx/controller/task_detail_controller.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

typedef Controllers = GetView<TaskDetailController>;

class TaskDetailAppbar extends Controllers implements PreferredSizeWidget {
  const TaskDetailAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      titleSpacing: 0,
      backgroundColor: AppColor.softWhite,
      surfaceTintColor: Colors.transparent,

      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        color: AppColor.grey900,
        onPressed: () => Get.back(),
      ),

      title: Obx(() {
        final task = controller.taskDetail.value;

        return Text(
          task?.title ?? 'Task Detail',
          overflow: TextOverflow.ellipsis,

          style: TextStyle(
            color: AppColor.grey900,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        );
      }),

      actions: [
        IconButton(
          icon: const Icon(Icons.edit_outlined),
          color: AppColor.grey900,

          onPressed: () {
            Get.toNamed(
              '/task/update',
              arguments: controller.taskDetail.value?.id,
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
