import 'package:flutter/material.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class CreateSubmitButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;

  const CreateSubmitButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20),

          backgroundColor: AppColor.grey900,
          foregroundColor: AppColor.softWhite,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),

        onPressed: onPressed,

        child: isLoading ? _progressIndicator() : const Text('Create Task'),
      ),
    );
  }

  Widget _progressIndicator() {
    return const SizedBox(
      height: 10,
      width: 10,
      child: CircularProgressIndicator(
        strokeWidth: 1,
        color: AppColor.softWhite,
      ),
    );
  }
}
