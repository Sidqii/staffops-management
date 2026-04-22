import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class DrawerMenuFooter extends StatelessWidget {
  final VoidCallback onTap;

  const DrawerMenuFooter({super.key, required this.onTap});

  static const titleTxtStyle = TextStyle(color: AppColor.softWhite);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.logout, color: AppColor.error),

      title: const Text('Sign Out', style: titleTxtStyle),

      onTap: () {
        Get.back();

        onTap();
      },
    );
  }
}
