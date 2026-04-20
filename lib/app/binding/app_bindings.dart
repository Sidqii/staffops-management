import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/config/network/dio_client.dart';
import 'package:mini_project_e2e_app/config/storage/credential/local_data.dart';
import 'package:mini_project_e2e_app/config/storage/credential/local_data_impl.dart';
import 'package:mini_project_e2e_app/config/storage/token/token_storage.dart';
import 'package:mini_project_e2e_app/config/storage/token/token_storage_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlutterSecureStorage>(() {
      return FlutterSecureStorage();
    });

    Get.lazyPut<TokenStorage>(() {
      return TokenStorageImpl(Get.find<FlutterSecureStorage>());
    });

    Get.lazyPut<DioClient>(() {
      return DioClient(Get.find<TokenStorage>());
    });

    Get.lazyPut<Dio>(() {
      return Get.find<DioClient>().dio;
    });

    Get.lazyPut<LocalData>(() {
      return LocalDataImpl(Get.find<SharedPreferences>());
    });
  }
}
