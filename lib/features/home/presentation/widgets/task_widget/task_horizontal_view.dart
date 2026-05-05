import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffops/features/home/presentation/getx/controller/dashboard_controller.dart';
import 'package:staffops/shared/themes/app_color.dart';

class TasksUser extends GetView<DashboardController> {
  const TasksUser({super.key});

  Color _statusColor(String? status) {
    switch (status) {
      case 'completed':
        return AppColor.success;
      case 'in_progress':
        return AppColor.blueTiran;
      default:
        return AppColor.grey600;
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

      return CustomScrollView(
        controller: controller.scrollController,

        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Recent Tasks',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.tasks.length + 1,

                  itemBuilder: (context, index) {
                    if (index == controller.tasks.length) {
                      return Obx(() {
                        if (controller.isLoadMore.value) {
                          return _loadingIndicator();
                        }

                        if (controller.showMore.value) {
                          return _horizontalEndCard();
                        }

                        return const SizedBox.shrink();
                      });
                    }

                    final task = controller.tasks[index];

                    return Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      margin: const EdgeInsets.only(right: 12),

                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed('/task/detail', arguments: task.id);
                        },

                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColor.greenPalm,
                            borderRadius: BorderRadius.circular(12),
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// TITLE
                              Text(
                                task.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColor.grey900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 6),

                              /// DESCRIPTION
                              Text(
                                task.description ?? 'no description',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColor.grey900.withValues(
                                    alpha: 0.7,
                                  ),
                                  fontSize: 12,
                                ),
                              ),

                              const Spacer(),

                              /// STATUS BADGE
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: _statusColor(
                                    task.status,
                                  ).withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  task.status,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: _statusColor(task.status),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
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
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.grey600,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(child: CircularProgressIndicator(strokeWidth: 1)),
    );
  }

  Widget _horizontalEndCard() {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.grey900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text(
          'All caught up!',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
