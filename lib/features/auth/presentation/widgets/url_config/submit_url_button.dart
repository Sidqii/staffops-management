import 'package:flutter/material.dart';
import 'package:staffops/shared/themes/app_color.dart';

class SubmitUrlButton extends StatelessWidget {
  final Future<void> Function() onPressed;

  const SubmitUrlButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.bottomEnd,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.grey900,
          foregroundColor: AppColor.softWhite,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: const Text('Done'),
      ),
    );
  }
}
