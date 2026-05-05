import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:staffops/config/storage/credential/local_data.dart';
import 'package:staffops/features/home/data/datasource/home_datasource.dart';
import 'package:staffops/features/home/data/datasource/home_datasource_impl.dart';
import 'package:staffops/features/home/data/repositories/home_repository.dart';
import 'package:staffops/features/home/data/repositories/home_repository_impl.dart';
import 'package:staffops/features/home/domain/usecase/dashboard_usecase.dart';
import 'package:staffops/features/home/domain/usecase/session_usecase.dart';
import 'package:staffops/features/home/presentation/getx/controller/dashboard_controller.dart';
import 'package:staffops/features/home/presentation/getx/controller/current_session.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    // data layer
    Get.lazyPut<HomeDatasource>(() {
      return HomeDatasourceImpl(Get.find<Dio>());
    });
    Get.lazyPut<HomeRepository>(() {
      return HomeRepositoryImpl(
        Get.find<HomeDatasource>(),
        Get.find<LocalData>(),
      );
    });

    // usecase
    Get.lazyPut(() => SessionUsecase(Get.find<HomeRepository>()));
    Get.lazyPut(() => DashboardUsecase(Get.find<HomeRepository>()));
    Get.lazyPut(() => CurrentSession(Get.find<SessionUsecase>()));

    // controller
    Get.lazyPut(() => DashboardController(Get.find<DashboardUsecase>(), Get.find()));
  }
}
