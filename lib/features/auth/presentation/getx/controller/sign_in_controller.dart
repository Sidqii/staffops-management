import 'package:get/get.dart';
import 'package:staffops/features/auth/domain/dto/sign_in_params.dart';
import 'package:staffops/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:staffops/shared/exception/server_exception.dart';

class SignInController extends GetxController {
  final SignInUsecase signInUsecase;

  SignInController(this.signInUsecase);

  RxBool isLoading = false.obs;

  Future<void> signIn(SignInParams params) async {
    isLoading(true);

    try {
      final user = await signInUsecase.execute(params);


      _successNotification('Good to see you again, ${user.name}!');

      Future.delayed(const Duration(milliseconds: 1800), () {
        Get.offAllNamed('/home');
      });
    } on ServerException catch (e) {
      _failedNotification(e.message);
    } catch (e) {
      _errorNotification('Oops! We’re having trouble signing you in.');
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
