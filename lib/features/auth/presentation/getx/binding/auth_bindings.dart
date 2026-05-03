import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:staffops/config/storage/credential/local_data.dart';
import 'package:staffops/config/storage/token/token_storage.dart';
import 'package:staffops/features/auth/data/datasource/auth_datasource.dart';
import 'package:staffops/features/auth/data/datasource/auth_datasource_impl.dart';
import 'package:staffops/features/auth/data/repositories/auth_repository.dart';
import 'package:staffops/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:staffops/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:staffops/features/auth/domain/usecase/sign_out_usecase.dart';
import 'package:staffops/features/auth/presentation/getx/controller/base_url_controller.dart';
import 'package:staffops/features/auth/presentation/getx/controller/sign_in_controller.dart';
import 'package:staffops/features/auth/presentation/getx/controller/sign_out_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    // data layer
    Get.lazyPut<AuthDatasource>(() {
      return AuthDatasourceImpl(Get.find<Dio>(), Get.find<TokenStorage>());
    });
    Get.lazyPut<AuthRepository>(() {
      return AuthRepositoryImpl(
        Get.find<AuthDatasource>(),
        Get.find<LocalData>(),
      );
    });

    // usecase
    Get.lazyPut(() => SignInUsecase(Get.find<AuthRepository>()));
    Get.lazyPut(() => SignOutUsecase(Get.find<AuthRepository>()));

    // controller
    Get.lazyPut(() => BaseUrlController());
    Get.lazyPut(() => SignInController(Get.find<SignInUsecase>()));
    Get.lazyPut(() => SignOutController(Get.find<SignOutUsecase>()));
  }
}
