import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class CalendarInputField extends StatelessWidget {
  final DateTime? date;
  final String? errorText;
  final VoidCallback onTap;
  final double? width;

  const CalendarInputField({
    super.key,
    required this.date,
    required this.onTap,
    this.width,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final isError = errorText != null;
    final controller = TextEditingController(text: _formateDate(date));

    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width * 0.42 - 1.1,

      child: TextField(
        controller: controller,

        readOnly: true,
        onTap: onTap,

        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 19,
            horizontal: 10,
          ),

          hintText: 'Select due date',
          hintStyle: TextStyle(color: AppColor.grey600),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: isError
                ? BorderSide(color: AppColor.error)
                : BorderSide(color: AppColor.grey600),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: isError
                ? BorderSide(color: AppColor.error)
                : BorderSide(color: AppColor.grey600),
          ),
        ),
      ),
    );
  }

  String? _formateDate(DateTime? date) {
    if (date == null) return null;

    return DateFormat('dd MMM yyyy').format(date);
  }
}
