import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffops/shared/themes/app_color.dart';

typedef SizeWidget = PreferredSizeWidget;

class UpdatedAppbarWidget extends StatelessWidget implements SizeWidget {
  const UpdatedAppbarWidget({super.key});

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
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),

      title: Text(
        'Update task',
        overflow: TextOverflow.ellipsis,
        style: titleAppbar,
      ),

      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.refresh_rounded)),
      ],
    );
  }
}
