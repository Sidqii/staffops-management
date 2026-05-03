import 'package:flutter/material.dart';
import 'package:staffops/shared/themes/app_color.dart';

class CreateTaskActionBtn extends StatelessWidget {
  final VoidCallback onPressed;

  const CreateTaskActionBtn({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.grey900,
          foregroundColor: AppColor.greenPalm,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
        ),

        child: const Text('Create Task'),
      ),
    );
  }
}