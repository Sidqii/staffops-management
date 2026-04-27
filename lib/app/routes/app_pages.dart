import 'package:get/get.dart';
import 'package:mini_project_e2e_app/app/binding/app_bindings.dart';

import 'package:mini_project_e2e_app/features/auth/presentation/getx/binding/auth_bindings.dart';
import 'package:mini_project_e2e_app/features/auth/presentation/getx/controller/base_url_controller.dart';
import 'package:mini_project_e2e_app/features/auth/presentation/pages/authentication_page.dart';
import 'package:mini_project_e2e_app/features/auth/presentation/pages/base_url_configuration.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/getx/binding/create_binding_controllers.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/getx/binding/data_layer_bindings.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/getx/binding/create_binding_usecases.dart';
import 'package:mini_project_e2e_app/features/home/presentation/getx/binding/home_bindings.dart';
import 'package:mini_project_e2e_app/features/home/presentation/pages/home_page.dart';
import 'package:mini_project_e2e_app/features/task/create_task/presentation/pages/create_task_form.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/presentation/getx/binding/task_detail_bindings.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/presentation/pages/task_detail_view.dart';

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
        Get.lazyPut<BaseUrlController>(() => BaseUrlController());
      }),
    ),

    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: BindingsBuilder(() {
        AppBindings().dependencies();
        TaskDetailBindings().dependencies();
        HomeBindings().dependencies();
      }),
    ),

    GetPage(
      name: AppRoutes.TASK_CREATE,
      page: () => CreateTaskForm(),
      binding: BindingsBuilder(() {
        AppBindings().dependencies();
        DataLayerBindings().dependencies();

        CreateBindingUsecases().dependencies();
        CreateBindingControllers().dependencies();
      }),
    ),

    GetPage(
      name: AppRoutes.TASK_DETAIL,
      page: () => TaskDetailView(),
      binding: BindingsBuilder(() {
        AppBindings().dependencies();
        TaskDetailBindings().dependencies();
      },),
    ),
  ];
}
