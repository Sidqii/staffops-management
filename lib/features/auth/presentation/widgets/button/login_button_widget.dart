import 'package:flutter/material.dart';
import 'package:staffops/shared/themes/app_color.dart';

class LoginButtonWidget extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;

  const LoginButtonWidget({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,

      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,

        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),

          foregroundColor: AppColor.softWhite,
          backgroundColor: AppColor.grey900,
          disabledBackgroundColor: AppColor.grey900,
        ),

        child: isLoading ? _progressIndicator() : const Text('Login'),
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
