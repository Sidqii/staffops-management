import 'package:get/get.dart';
import 'package:mini_project_e2e_app/app/binding/app_bindings.dart';

import 'package:mini_project_e2e_app/features/auth/presentation/getx/binding/auth_bindings.dart';
import 'package:mini_project_e2e_app/features/auth/presentation/getx/controller/base_url_controller.dart';
import 'package:mini_project_e2e_app/features/auth/presentation/pages/authentication_page.dart';
import 'package:mini_project_e2e_app/features/auth/presentation/pages/base_url_configuration.dart';
import 'package:mini_project_e2e_app/features/tasks/presentation/getx/binding/create_binding_controllers.dart';
import 'package:mini_project_e2e_app/features/tasks/presentation/getx/binding/data_layer_bindings.dart';
import 'package:mini_project_e2e_app/features/tasks/presentation/getx/binding/create_binding_usecases.dart';
import 'package:mini_project_e2e_app/features/home/presentation/getx/binding/home_bindings.dart';
import 'package:mini_project_e2e_app/features/home/presentation/pages/home_page.dart';
import 'package:mini_project_e2e_app/features/tasks/presentation/pages/create_task_form.dart';

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
      binding: HomeBindings(),
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
  ];
}
