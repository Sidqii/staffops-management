import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/home/domain/usecase/session_usecase.dart';
import 'package:mini_project_e2e_app/shared/entities/user/user.dart';
import 'package:mini_project_e2e_app/shared/exception/server_exception.dart';

class CurrentSession extends GetxController {
  final SessionUsecase usecase;

  CurrentSession(this.usecase);

  RxBool isLoading = false.obs;

  Rxn<User> credential = Rxn<User>();

  @override
  void onInit() {
    super.onInit();

    loadUser();
  }

  Future<void> loadUser() async {
    isLoading(false);

    try {
      final result = await usecase.execute();

      credential.value = result;
    } on ServerException catch (e) {
      _failedNotification(e.message);
    } catch (e) {
      _errorNotification('Credential is empty');
    } finally {
      isLoading(false);
    }
  }

  void _failedNotification(String message) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar('Failed', message);
    }
  }

  void _errorNotification(String message) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar('Error', message);
    }
  }
}
