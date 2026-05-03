import 'package:staffops/features/auth/data/models/request/sign_up_request.dart';

class SignUpParams {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;

  SignUpParams({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  SignUpRequest toRequest() {
    return SignUpRequest(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}
