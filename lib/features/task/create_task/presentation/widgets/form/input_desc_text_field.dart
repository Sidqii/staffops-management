import 'package:flutter/material.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class InputDescTextField extends StatelessWidget {
  final String? descText;
  final TextEditingController controller;

  const InputDescTextField({
    super.key,
    this.descText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,

      maxLines: 5,

      cursorWidth: 1,
      cursorColor: AppColor.grey900,
      cursorErrorColor: AppColor.error,

      decoration: InputDecoration(
        hintText: descText,
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
