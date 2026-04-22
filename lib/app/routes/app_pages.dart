import 'package:get/get.dart';
import 'package:mini_project_e2e_app/app/binding/app_bindings.dart';

import 'package:mini_project_e2e_app/features/auth/presentation/getx/binding/auth_bindings.dart';
import 'package:mini_project_e2e_app/features/auth/presentation/pages/authentication_page.dart';
import 'package:mini_project_e2e_app/features/home/presentation/getx/binding/home_bindings.dart';
import 'package:mini_project_e2e_app/features/home/presentation/pages/home_page.dart';
import 'package:mini_project_e2e_app/features/task/presentation/getx/binding/task_bindings.dart';
import 'package:mini_project_e2e_app/features/task/presentation/pages/create_task_form.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.AUTH,
      page: () => AuthenticationPage(),
      binding: BindingsBuilder(() {
        AppBindings().dependencies();
        AuthBindings().dependencies();
      }),
    ),

    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBindings(),
    ),

    GetPage(
      name: AppRoutes.TASK_CREATE,
      page: () => CreateTaskForm(),
      binding: BindingsBuilder(() {
        AppBindings().dependencies();
        TaskBindings().dependencies();
      }),
    ),
  ];
}
