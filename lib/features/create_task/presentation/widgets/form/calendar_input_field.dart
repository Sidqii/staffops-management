import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class CalendarInputField extends StatelessWidget {
  final DateTime? date;

  const CalendarInputField({super.key, this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42 - 1.1,
      padding: const EdgeInsets.only(left: 15, top: 18, bottom: 18),

      decoration: BoxDecoration(
        border: Border.all(color: AppColor.grey600),
        borderRadius: BorderRadius.circular(15),
      ),

      child: _dateContentText(date),
    );
  }

  Widget _dateContentText(DateTime? value) {
    if (value == null) {
      return Text(
        'Select due date',
        style: TextStyle(color: AppColor.grey600, fontSize: 16),
      );
    }

    return Text(
      DateFormat('dd MMM yyyy').format(value),
      style: TextStyle(color: AppColor.grey900, fontSize: 16),
    );
  }
}
