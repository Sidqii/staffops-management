import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffops/shared/themes/app_color.dart';

class AppBarCreateTask extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCreateTask({super.key});

  static const barTitle = TextStyle(
    fontSize: 20,
    color: AppColor.grey900,
    fontWeight: FontWeight.w400,
  );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Text('Create new task', style: barTitle),
        ),
      ],
    );
  }
}
