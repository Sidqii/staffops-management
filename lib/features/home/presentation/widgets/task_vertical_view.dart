import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_e2e_app/features/home/presentation/getx/controller/dashboard_controller.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class TaskVerticalView extends GetView<DashboardController> {
  const TaskVerticalView({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoading = controller.isLoading.value;
      final isEmpty = controller.tasks.isEmpty;

      if (isLoading && isEmpty) {
        return _initialLoadIndicator();
      }

      if (isEmpty) {
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Task is empty, '),

              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async => await controller.refresh(),

                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    'refresh here.',
                    style: TextStyle(color: AppColor.primary),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      return RefreshIndicator(
        color: AppColor.softWhite,
        backgroundColor: AppColor.grey900,
        elevation: 0,
        strokeWidth: 1,
        displacement: 25,

        onRefresh: () async => await controller.refresh(),

        child: CustomScrollView(
          controller: controller.scrollController,

          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final task = controller.tasks[index];

                return ListTile(
                  key: ValueKey(task.id),

                  contentPadding: EdgeInsets.only(left: 16),

                  onTap: () {
                    Get.toNamed('/task/detail', arguments: task.id);
                  },

                  leading: CircleAvatar(
                    backgroundColor: AppColor.grey900,
                    child: Text(
                      task.title[0].toUpperCase(),
                      style: TextStyle(color: AppColor.softWhite),
                    ),
                  ),

                  title: Text(task.title, overflow: TextOverflow.ellipsis,),

                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.description ?? 'no description',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: _statusColor(
                            task.status,
                          ).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          task.status,
                          style: TextStyle(
                            fontSize: 11,
                            color: _statusColor(task.status),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'edit') {
                        // edit
                      } else if (value == 'delete') {
                        // delete
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(value: 'edit', child: Text('Edit')),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                );
              }, childCount: controller.tasks.length),
            ),

            SliverToBoxAdapter(
              child: Obx(() {
                if (controller.isLoadMore.value) {
                  return _loadingIndicator();
                }

                if (controller.showMore.value) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Align(
                      alignment: AlignmentGeometry.centerRight,
                      child: Text(
                        'All caught up!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }

                return const SizedBox();
              }),
            ),
          ],
        ),
      );
    });
  }

  Widget _initialLoadIndicator() {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 1,
        color: AppColor.grey900,
        backgroundColor: AppColor.blueWhale,
      ),
    );
  }

  Widget _loadingIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: LinearProgressIndicator(
        minHeight: 1,
        color: AppColor.grey900,
        backgroundColor: AppColor.blueWhale,
      ),
    );
  }
}
