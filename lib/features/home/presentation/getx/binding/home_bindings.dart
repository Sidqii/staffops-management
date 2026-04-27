import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/config/storage/credential/local_data.dart';
import 'package:mini_project_e2e_app/features/home/data/datasource/home_datasource.dart';
import 'package:mini_project_e2e_app/features/home/data/datasource/home_datasource_impl.dart';
import 'package:mini_project_e2e_app/features/home/data/repositories/home_repository.dart';
import 'package:mini_project_e2e_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:mini_project_e2e_app/features/home/domain/usecase/dashboard_usecase.dart';
import 'package:mini_project_e2e_app/features/home/domain/usecase/session_usecase.dart';
import 'package:mini_project_e2e_app/features/home/presentation/getx/controller/dashboard_controller.dart';
import 'package:mini_project_e2e_app/features/home/presentation/getx/controller/current_session.dart';

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

    Get.lazyPut<SessionUsecase>(() {
      return SessionUsecase(Get.find<HomeRepository>());
    });

    Get.lazyPut<DashboardUsecase>(() {
      return DashboardUsecase(Get.find<HomeRepository>());
    });

    Get.lazyPut<CurrentSession>(() {
      return CurrentSession(Get.find<SessionUsecase>());
    });

    Get.lazyPut<DashboardController>(() {
      return DashboardController(Get.find<DashboardUsecase>());
    });
  }
}
