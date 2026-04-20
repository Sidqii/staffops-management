import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_e2e_app/features/home/presentation/getx/controller/fetch_tasks_controller.dart';

class TasksUser extends GetView<FetchTasksController> {
  const TasksUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoading = controller.isLoading.value;
      final isEmpty = controller.tasks.isEmpty;

      if (isLoading && isEmpty) {
        return _loadingIndicator();
      }

      if (isEmpty) {
        return const Center(child: Text('Task is empty'));
      }

      return RefreshIndicator(
        onRefresh: () async => await controller.refresh(),

        child: CustomScrollView(
          controller: controller.scrollController,

          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final task = controller.tasks[index];

                return ListTile(
                  key: ValueKey(task.id),
                  title: Text(task.title),
                  subtitle: Text(task.description),
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
                    padding: EdgeInsets.all(14),
                    child: Text('No more task👍'),
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

  Widget _loadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Center(child: CircularProgressIndicator(strokeWidth: 1)),
    );
  }
}
