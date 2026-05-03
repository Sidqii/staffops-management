import 'package:get/get.dart';
// app binding
import 'package:staffops/app/binding/app_bindings.dart';

// auth
import 'package:staffops/features/auth/presentation/getx/binding/auth_bindings.dart';
import 'package:staffops/features/auth/presentation/pages/authentication_page.dart';

// url config
import 'package:staffops/features/auth/presentation/pages/base_url_configuration.dart';
import 'package:staffops/features/auth/presentation/getx/controller/base_url_controller.dart';

// home
import 'package:staffops/features/home/presentation/pages/home_page.dart';
import 'package:staffops/features/home/presentation/getx/binding/home_bindings.dart';

// task -> create
import 'package:staffops/features/task/create_task/presentation/pages/create_task_form.dart';
import 'package:staffops/features/task/create_task/presentation/getx/binding/create_task_bindings.dart';

// task -> detail
import 'package:staffops/features/task/detail_task/presentation/pages/task_detail_view.dart';
import 'package:staffops/features/task/detail_task/presentation/getx/binding/detail_task_bindings.dart';

// task -> update
import 'package:staffops/features/task/update_task/presentation/pages/update_task_form.dart';
import 'package:staffops/features/task/update_task/presentation/getx/binding/update_task_bindings.dart';

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
      name: AppRoutes.CONFIGURATION,
      page: () => BaseUrlConfiguration(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => BaseUrlController());
      }),
    ),

    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: BindingsBuilder(() {
        AppBindings().dependencies();
        HomeBindings().dependencies();
      }),
    ),

    GetPage(
      name: AppRoutes.TASK_CREATE,
      page: () => CreateTaskForm(),
      binding: BindingsBuilder(() {
        AppBindings().dependencies();
        CreateTaskBindings().dependencies();
      }),
    ),

    GetPage(
      name: AppRoutes.TASK_DETAIL,
      page: () => TaskDetailView(),
      binding: BindingsBuilder(() {
        AppBindings().dependencies();
        DetailTaskBindings().dependencies();
      }),
    ),

    GetPage(
      name: AppRoutes.TASK_UPDATE,
      page: () => UpdateTaskForm(),
      binding: BindingsBuilder(() {
        AppBindings().dependencies();
        UpdateTaskBindings().dependencies();
      }),
    ),
  ];
}
