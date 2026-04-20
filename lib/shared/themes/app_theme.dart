import 'package:flutter/material.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.softWhite,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
    ),

    scaffoldBackgroundColor: AppColor.softWhite,
  );
}
