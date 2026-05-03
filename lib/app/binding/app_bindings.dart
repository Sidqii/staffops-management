import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:staffops/config/network/dio_client.dart';
import 'package:staffops/config/storage/credential/local_data.dart';
import 'package:staffops/config/storage/credential/local_data_impl.dart';
import 'package:staffops/config/storage/token/token_storage.dart';
import 'package:staffops/config/storage/token/token_storage_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FlutterSecureStorage());

    Get.lazyPut<TokenStorage>(() {
      return TokenStorageImpl(Get.find<FlutterSecureStorage>());
    });

    Get.lazyPut(() {
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
