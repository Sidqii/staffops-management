import 'package:flutter/material.dart';
import 'package:staffops/shared/themes/app_color.dart';

class BaseUrlInputWidget extends StatelessWidget {
  final TextEditingController controller;

  const BaseUrlInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorWidth: 1,

      cursorColor: AppColor.grey900,
      cursorErrorColor: AppColor.error,

      keyboardType: TextInputType.url,

      decoration: InputDecoration(
        hintText: 'https://your-api-url.com',
        hintStyle: TextStyle(color: AppColor.grey600),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.grey600),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.grey900),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.warning),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.error),
        ),
      ),
    );
  }
}
