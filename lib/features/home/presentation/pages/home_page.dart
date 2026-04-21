import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mini_project_e2e_app/features/auth/presentation/getx/controller/sign_out_controller.dart';
import 'package:mini_project_e2e_app/features/home/presentation/getx/controller/fetch_tasks_controller.dart';
import 'package:mini_project_e2e_app/features/home/presentation/getx/controller/fetch_credential_controller.dart';
import 'package:mini_project_e2e_app/features/home/presentation/widgets/tasks_user.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class HomePage extends GetView<FetchCredentialController> {
  const HomePage({super.key});

  static const TextStyle titleText = TextStyle(
    color: AppColor.grey900,
    fontSize: 45,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitleText = TextStyle(
    color: AppColor.grey900,
    fontSize: 12,
  );

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final taskController = Get.find<FetchTasksController>();
    final signController = Get.find<SignOutController>();

    return Scaffold(
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
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Text(
                          controller.credential.value?.name[0].toUpperCase() ??
                              'G',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${controller.credential.value?.name}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ' | ${controller.credential.value?.role?.name}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        controller.credential.value?.email ?? 'guest@mail.com',
                        style: const TextStyle(
                          color: AppColor.softWhite,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),

            /// 🔥 MENU (SCROLLABLE)
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.home_rounded,
                      color: AppColor.softWhite,
                    ),
                    title: const Text(
                      'Home',
                      style: TextStyle(color: AppColor.softWhite),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: AppColor.softWhite,
                    ),
                    title: const Text(
                      'Profile',
                      style: TextStyle(color: AppColor.softWhite),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),

            /// 🔥 LOGOUT (FIXED DI BAWAH)
            const Divider(height: 1),

            ListTile(
              leading: const Icon(Icons.logout, color: AppColor.error),
              title: const Text(
                'Logout',
                style: TextStyle(color: AppColor.softWhite),
              ),
              onTap: () {
                Get.dialog(
                  Dialog(
                    child: Container(
                      width: MediaQuery.of(context).size.height * 0.23,
                      height: MediaQuery.of(context).size.height * 0.15,

                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),

                      decoration: BoxDecoration(
                        color: AppColor.softWhite,
                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Wait, Stay!',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Are you leaving me all alone, ${controller.credential.value?.name}? 😭',
                          ),

                          Spacer(),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            spacing: 5,
                            children: [
                              TextButton(
                                onPressed: () => Get.back(),
                                child: const Text(
                                  'Not yet',
                                  style: TextStyle(color: AppColor.grey900),
                                ),
                              ),

                              SizedBox(
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.error,
                                    foregroundColor: AppColor.softWhite,
                                  ),
                                  onPressed: () async {
                                    Get.back();
                                    await signController.signOut();
                                  },
                                  child: const Text('Yes sure!'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            _headerMenuActionButton(),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Obx(() {
                  final credential = controller.credential.value;
                  final user = credential?.name ?? 'Guest';

                  final total = taskController.total.value.toString();
                  final current = taskController.tasks.length.toString();

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _currentCredentialProfile(user, current, total),

                      _createTaskActionButton(() {}),
                    ],
                  );
                }),
              ),
            ),

            _tasksListContainer(const TasksUser(), height * 0.6),
          ],
        ),
      ),
    );
  }

  Widget _headerMenuActionButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Builder(
        builder: (context) {
          return SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },

                  icon: Icon(Icons.grid_view_rounded),
                ),

                Text(
                  DateFormat('d MMM').format(DateTime.now()),
                  style: TextStyle(fontSize: 30),
                ),

                IconButton(onPressed: () {}, icon: Icon(Icons.history_sharp)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _currentCredentialProfile(String name, String current, String total) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: titleText),

        Text('Loaded $current out of $total task.', style: subtitleText),
      ],
    );
  }

  Widget _createTaskActionButton(VoidCallback onPressed) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.grey900,
          foregroundColor: AppColor.softWhite,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
        ),

        child: const Text('Create Task'),
      ),
    );
  }

  Widget _tasksListContainer(Widget child, double height) {
    return Container(
      height: height,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: const BoxDecoration(
        color: AppColor.softWhite,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(45)),
      ),
      child: child,
    );
  }
}
