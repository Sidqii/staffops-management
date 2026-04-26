import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/config/storage/credential/local_data.dart';
import 'package:mini_project_e2e_app/config/storage/token/token_storage.dart';
import 'package:mini_project_e2e_app/features/auth/data/datasource/auth_datasource.dart';
import 'package:mini_project_e2e_app/features/auth/data/datasource/auth_datasource_impl.dart';
import 'package:mini_project_e2e_app/features/auth/data/repositories/auth_repository.dart';
import 'package:mini_project_e2e_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mini_project_e2e_app/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:mini_project_e2e_app/features/auth/domain/usecase/sign_out_usecase.dart';
import 'package:mini_project_e2e_app/features/auth/presentation/getx/controller/base_url_controller.dart';
import 'package:mini_project_e2e_app/features/auth/presentation/getx/controller/sign_in_controller.dart';
import 'package:mini_project_e2e_app/features/auth/presentation/getx/controller/sign_out_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    // datasource
    Get.lazyPut<AuthDatasource>(() {
      return AuthDatasourceImpl(Get.find<Dio>(), Get.find<TokenStorage>());
    });

    // repository
    Get.lazyPut<AuthRepository>(() {
      return AuthRepositoryImpl(
        Get.find<AuthDatasource>(),
        Get.find<LocalData>(),
      );
    });

    Get.lazyPut<SignInUsecase>(() {
      return SignInUsecase(Get.find<AuthRepository>());
    });

    Get.lazyPut<SignOutUsecase>(() {
      return SignOutUsecase(Get.find<AuthRepository>());
    });

    // controller
    Get.lazyPut<BaseUrlController>(() {
      return BaseUrlController();
    });

    Get.lazyPut<SignInController>(() {
      return SignInController(Get.find<SignInUsecase>());
    });

    Get.lazyPut<SignOutController>(() {
      return SignOutController(Get.find<SignOutUsecase>());
    });
  }
}
