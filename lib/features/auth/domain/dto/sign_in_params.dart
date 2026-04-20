import 'package:mini_project_e2e_app/features/auth/data/models/request/sign_in_request.dart';

class SignInParams {
  final String email;
  final String password;

  SignInParams({required this.email, required this.password});

  SignInRequest toRequest() {
    return SignInRequest(email: email, password: password);
  }
}
