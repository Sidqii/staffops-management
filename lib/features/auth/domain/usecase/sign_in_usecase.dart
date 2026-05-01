import 'package:mini_project_e2e_app/features/auth/data/repositories/auth_repository.dart';
import 'package:mini_project_e2e_app/features/auth/domain/dto/sign_in_params.dart';
import 'package:mini_project_e2e_app/shared/entities/user/user.dart';

class SignInUsecase {
  final AuthRepository repository;

  SignInUsecase(this.repository);

  Future<User> execute(SignInParams request) async {
    return await repository.signIn(request.toRequest());
  }
}
