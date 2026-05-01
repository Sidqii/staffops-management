import 'package:flutter/material.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String Function(T) label;
  final ValueChanged<T?> onChanged;
  final String? hintText;
  final double? width;
  final String? errorText;

  const CustomDropdownField({
    super.key,
    required this.value,
    required this.items,
    required this.label,
    this.hintText,
    required this.onChanged,
    this.width,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final isError = errorText != null;

    return DropdownMenu(
      key: ValueKey(value),

      width: width ?? MediaQuery.of(context).size.width * 0.43,

      initialSelection: value,

      hintText: hintText,

      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(AppColor.softWhite),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: AppColor.grey600),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: isError
              ? BorderSide(color: AppColor.error)
              : BorderSide(color: AppColor.grey600),
        ),
      ),

      onSelected: (selected) {
        if (selected == null) {
          onChanged(null);
        } else {
          onChanged(selected);
        }
      },

      dropdownMenuEntries: items.map((item) {
        return DropdownMenuEntry<T>(value: item, label: label(item));
      }).toList(),
    );
  }
}
