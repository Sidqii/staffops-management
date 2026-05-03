import 'package:get/get.dart';
import 'package:staffops/features/auth/domain/usecase/sign_out_usecase.dart';
import 'package:staffops/shared/exception/server_exception.dart';

class SignOutController extends GetxController {
  final SignOutUsecase usecase;

  SignOutController(this.usecase);

  RxBool isLoading = false.obs;

  Future<void> signOut() async {
    isLoading(true);

    try {
      await usecase.execute();

      _successNotification('Logged out successfully. Have a great day!');

      Future.delayed(const Duration(milliseconds: 1500), () {
        Get.offAllNamed('/auth');
      });
    } on ServerException catch (e) {
      _failedNotification(e.message);
    } catch (e) {
      _errorNotification("Oops! We couldn't sign you out. Please try again.");
    } finally {
      isLoading(false);
    }
  }

  void _successNotification(String message) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar('Suceess', message);
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
