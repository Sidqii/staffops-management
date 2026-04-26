import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/auth/presentation/getx/controller/sign_out_controller.dart';
import 'package:mini_project_e2e_app/features/home/presentation/getx/controller/fetch_tasks_controller.dart';
import 'package:mini_project_e2e_app/features/home/presentation/getx/controller/fetch_credential_controller.dart';
import 'package:mini_project_e2e_app/features/home/presentation/widgets/dialog/sign_out_dialog.dart';
import 'package:mini_project_e2e_app/features/home/presentation/widgets/home_menu/create_task_action_btn.dart';
import 'package:mini_project_e2e_app/features/home/presentation/widgets/home_menu/home_header_action.dart';
import 'package:mini_project_e2e_app/features/home/presentation/widgets/home_menu/task_list_container.dart';
import 'package:mini_project_e2e_app/features/home/presentation/widgets/home_menu/total_task_completed.dart';
import 'package:mini_project_e2e_app/features/home/presentation/widgets/home_menu/user_summary_section.dart';
import 'package:mini_project_e2e_app/features/home/presentation/widgets/side_bar/drawer_menu_body.dart';
import 'package:mini_project_e2e_app/features/home/presentation/widgets/side_bar/drawer_menu_footer.dart';
import 'package:mini_project_e2e_app/features/home/presentation/widgets/side_bar/drawer_menu_header.dart';
import 'package:mini_project_e2e_app/features/home/presentation/widgets/tasks_user.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class HomePage extends GetView<FetchCredentialController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final taskController = Get.find<FetchTasksController>();
    final signController = Get.find<SignOutController>();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        if (!await _confirmLogout()) return;

        signController.signOut();
      },

      child: Scaffold(
        backgroundColor: AppColor.greenPalm,

        drawer: Drawer(
          backgroundColor: AppColor.grey900,
          width: MediaQuery.of(context).size.width * 0.50,

          child: Column(
            children: [
              DrawerHeader(
                margin: EdgeInsets.zero,
                decoration: const BoxDecoration(color: AppColor.grey900),

                child: SizedBox(
                  width: double.infinity,
                  child: Obx(() {
                    return DrawerMenuHeader(
                      name: controller.credential.value?.name,
                      role: controller.credential.value?.role?.name,
                      mail: controller.credential.value?.email,
                    );
                  }),
                ),
              ),

              DrawerMenuBody(),

              const Divider(height: 1),

              DrawerMenuFooter(
                onTap: () async {
                  if (!await _confirmLogout()) return;

                  signController.signOut();
                },
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),

        body: SafeArea(
          child: Column(
            children: [
              HomeHeaderAction(),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Obx(() {
                    final roleAccess = controller.credential.value?.role?.name;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UserSummarySection(
                          name: controller.credential.value?.name ?? 'Guest',
                          current: taskController.tasks.length.toString(),
                          total: taskController.total.toString(),
                        ),

                        _canCreateTask(roleAccess)
                            ? CreateTaskActionBtn(
                                onPressed: () async {
                                  final result = await Get.toNamed(
                                    '/task/create',
                                  );
                                  _successNotification(result, taskController);
                                },
                              )
                            : Obx(() {
                                return TotalTaskCompleted(
                                  totalCompleted: taskController.totalCompleted,
                                );
                              }),
                      ],
                    );
                  }),
                ),
              ),

              TaskListContainer(child: const TasksUser(), height: height * 0.6),
            ],
          ),
        ),
      ),
    );
  }

  void _successNotification(bool? result, FetchTasksController taskController) {
    if (result == true) {
      taskController.refresh();

      Get.snackbar('Success', "Task created! You're all set");
    }
  }

  Future<bool> _confirmLogout() async {
    final userName = controller.credential.value?.name ?? 'Guest';

    return await Get.dialog<bool>(SignOutDialog(name: userName)) ?? false;
  }

  bool _canCreateTask(String? role) {
    return role == 'admin' || role == 'owner' || role == 'pm';
  }
}
