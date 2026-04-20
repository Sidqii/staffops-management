import 'package:mini_project_e2e_app/features/auth/data/repositories/auth_repository.dart';
import 'package:mini_project_e2e_app/features/auth/domain/dto/sign_up_params.dart';

class SignUpUsecase {
  final AuthRepository repository;

  SignUpUsecase(this.repository);

  Future<void> execute(SignUpParams request) async {
    await repository.signUp(request.toRequest());
  }
}
