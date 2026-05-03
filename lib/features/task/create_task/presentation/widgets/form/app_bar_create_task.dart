import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffops/shared/themes/app_color.dart';

class AppBarCreateTask extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCreateTask({super.key});

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
      automaticallyImplyLeading: false,

      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          spacing: 15,
          children: [
            Icon(Icons.assignment, size: 20, color: AppColor.grey900),

            Text('Create task form', style: titleAppbar),
          ],
        ),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.close_rounded),
          ),
        ),
      ],
    );
  }
}
