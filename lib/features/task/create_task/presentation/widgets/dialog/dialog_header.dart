import 'package:flutter/material.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class DialogHeader extends StatelessWidget {
  final VoidCallback onPressed;

  const DialogHeader({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          padding: const EdgeInsets.all(8),

          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColor.grey600, width: 0.5),
          ),

          child: Icon(Icons.cloud, color: AppColor.grey900, size: 20),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Upload files',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const Text(
              'Select and upload the files of your choice',
              style: TextStyle(color: AppColor.grey600),
            ),
          ],
        ),

        Spacer(),

        IconButton(onPressed: onPressed, icon: Icon(Icons.close_rounded)),
      ],
    );
  }
}
