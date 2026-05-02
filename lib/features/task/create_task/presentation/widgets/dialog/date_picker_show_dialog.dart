import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class DatePickerShowDialog {
  static Future<DateTime?> show(
    BuildContext context,
    DateTime? initDate,
  ) async {
    final current = DateTime.now();
    final today = DateTime(current.year, current.month, current.day);

    final selected = initDate ?? today;

    return await showDialog<DateTime>(
      context: context,

      builder: (context) {
        return Dialog(
          backgroundColor: AppColor.softWhite,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),

          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 400, maxWidth: 350),

            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(primary: AppColor.blueTiran),
              ),

              child: DatePicker(
                key: ValueKey(selected),

                minDate: today,
                maxDate: DateTime(2100),

                selectedDate: selected,

                theme: DatePickerPlusTheme(
                  headerTheme: HeaderTheme(
                    leadingDateTextStyle: TextStyle(fontSize: 50),
                    enableArrowKeys: false,
                  ),
                ),

                onDateSelected: (value) => Get.back(result: value),
              ),
            ),
          ),
        );
      },
    );
  }
}
