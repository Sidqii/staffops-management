import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:staffops/app/binding/app_bindings.dart';
import 'package:staffops/app/routes/app_pages.dart';
import 'package:staffops/shared/themes/app_theme.dart';
import 'package:staffops/shared/themes/dismiss_keyboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  Get.put<SharedPreferences>(prefs);

  await initializeDateFormatting('id_ID', null);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBindings(),

      defaultTransition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 250),

      getPages: AppPages.routes,
      initialRoute: AppRoutes.AUTH,

      theme: AppTheme.theme,

      builder: (context, child) => DismissKeyboard(child: child!),
    );
  }
}
