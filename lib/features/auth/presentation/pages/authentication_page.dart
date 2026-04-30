import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/config/network/dio_client.dart';
import 'package:mini_project_e2e_app/config/storage/token/token_storage.dart';
import 'package:mini_project_e2e_app/features/auth/data/datasource/auth_datasource.dart';
import 'package:mini_project_e2e_app/features/auth/data/repositories/auth_repository.dart';
import 'package:mini_project_e2e_app/features/auth/domain/dto/sign_in_params.dart';
import 'package:mini_project_e2e_app/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:mini_project_e2e_app/features/auth/presentation/getx/binding/auth_bindings.dart';
import 'package:mini_project_e2e_app/features/auth/presentation/getx/controller/sign_in_controller.dart';
import 'package:mini_project_e2e_app/features/auth/presentation/widgets/email_input_widget.dart';
import 'package:mini_project_e2e_app/features/auth/presentation/widgets/button/login_button_widget.dart';
import 'package:mini_project_e2e_app/features/auth/presentation/widgets/password_input_widget.dart';
import 'package:mini_project_e2e_app/shared/ops_logo.dart';

class AuthenticationPage extends GetView<SignInController> {
  AuthenticationPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final textStyle = const TextStyle(fontSize: 14);

  final facebookIcon = Image.asset(
    'assets/icons/facebook.png',
    width: 24,
    height: 24,
  );

  final gmailIcon = Image.asset(
    'assets/icons/gmail.png',
    width: 24,
    height: 24,
  );

  final appleIcon = Image.asset(
    'assets/icons/apple.png',
    width: 24,
    height: 24,
  );

  @override
  Widget build(BuildContext context) {
    return _contentContainer([
      const Text('Sign up', style: TextStyle(fontSize: 50)),

      const SizedBox(height: 20),

      Text(' Email', style: textStyle),
      const SizedBox(height: 5),
      EmailInputWidget(controller: emailController),

      const SizedBox(height: 20),

      Text(' Password', style: textStyle),
      const SizedBox(height: 5),
      PasswordInputWidget(controller: passwordController),

      const SizedBox(height: 30),

      Obx(() {
        return LoginButtonWidget(
          isLoading: controller.isLoading.value,
          onPressed: () {
            FocusScope.of(context).unfocus();

            controller.signIn(
              SignInParams(
                email: emailController.text,
                password: passwordController.text,
              ),
            );
          },
        );
      }),

      const SizedBox(height: 30),

      Center(child: Text('Or Register with')),

      const SizedBox(height: 15),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(icon: gmailIcon, onPressed: () {}),

          SizedBox(width: 15),

          IconButton(icon: facebookIcon, onPressed: () {}),

          SizedBox(width: 15),

          IconButton(icon: appleIcon, onPressed: () {}),
        ],
      ),
    ]);
  }

  Widget _contentContainer(List<Widget> children) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: children,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            Positioned(
              right: 20,
              bottom: 20,
              child: GestureDetector(
                onTap: () async {
                  final result = await Get.toNamed('/configuration');

                  if (result == true) {
                    refreshDependenciesAfterConfig();
                  }
                },

                child: OpsLogo(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void refreshDependenciesAfterConfig() {
    // 1. delete auth chain
    Get.delete<SignInController>(force: true);
    Get.delete<SignInUsecase>(force: true);
    Get.delete<AuthRepository>(force: true);
    Get.delete<AuthDatasource>(force: true);

    // 2. delete core
    Get.delete<Dio>(force: true);
    Get.delete<DioClient>(force: true);

    // 3. recreate core
    final tokenStorage = Get.find<TokenStorage>();
    final dioClient = DioClient(tokenStorage);

    Get.put(dioClient);
    Get.put(dioClient.dio);

    // 4. re-inject auth
    AuthBindings().dependencies();
  }
}
