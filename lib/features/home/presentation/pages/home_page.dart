import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

    return Scaffold(
      backgroundColor: AppColor.greenPalm,
      body: SafeArea(
        child: Column(
          children: [
            _headerMenuActionButton(),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.grid_view_rounded)),

            Text(
              DateFormat('d MMM').format(DateTime.now()),
              style: TextStyle(fontSize: 30),
            ),

            IconButton(onPressed: () {}, icon: Icon(Icons.dehaze_rounded)),
          ],
        ),
      ),
    );
  }

  Widget _currentCredentialProfile(String name, String current, String total) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: titleText),

        Text('Showing $current of $total tasks.', style: subtitleText),
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
      padding: EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: AppColor.softWhite,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
      ),
      child: child,
    );
  }
}
