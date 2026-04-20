import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/config/storage/credential/local_data.dart';
import 'package:mini_project_e2e_app/features/home/data/datasource/home_datasource.dart';
import 'package:mini_project_e2e_app/features/home/data/datasource/home_datasource_impl.dart';
import 'package:mini_project_e2e_app/features/home/data/repositories/home_repository.dart';
import 'package:mini_project_e2e_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:mini_project_e2e_app/features/home/domain/usecase/fetch_tasks_usecase.dart';
import 'package:mini_project_e2e_app/features/home/domain/usecase/get_current_user.dart';
import 'package:mini_project_e2e_app/features/home/presentation/getx/controller/fetch_tasks_controller.dart';
import 'package:mini_project_e2e_app/features/home/presentation/getx/controller/fetch_credential_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeDatasource>(() {
      return HomeDatasourceImpl(Get.find<Dio>());
    });

    Get.lazyPut<HomeRepository>(() {
      return HomeRepositoryImpl(
        Get.find<HomeDatasource>(),
        Get.find<LocalData>(),
      );
    });

    Get.lazyPut<GetCurrentUser>(() {
      return GetCurrentUser(Get.find<HomeRepository>());
    });

    Get.lazyPut<FetchTasksUsecase>(() {
      return FetchTasksUsecase(Get.find<HomeRepository>());
    });

    Get.lazyPut<FetchCredentialController>(() {
      return FetchCredentialController(Get.find<GetCurrentUser>());
    });

    Get.lazyPut<FetchTasksController>(() {
      return FetchTasksController(Get.find<FetchTasksUsecase>());
    });
  }
}
