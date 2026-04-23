import 'package:flutter/material.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String Function(T) labelBuilder;
  final ValueChanged<T?> onChanged;
  final String hintText;
  final double? width;

  const CustomDropdownField({
    super.key,
    required this.value,
    required this.items,
    required this.labelBuilder,
    required this.hintText,
    required this.onChanged,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
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
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintStyle: TextStyle(color: AppColor.grey600),
      ),

      onSelected: (selected) {
        if (selected == null) {
          onChanged(null);
        } else {
          onChanged(selected);
        }
      },

      dropdownMenuEntries: items.map((item) {
        return DropdownMenuEntry<T>(value: item, label: labelBuilder(item));
      }).toList(),
    );
  }
}
