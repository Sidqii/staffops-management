import 'package:staffops/features/auth/data/repositories/auth_repository.dart';
import 'package:staffops/features/auth/domain/dto/sign_up_params.dart';

class SignUpUsecase {
  final AuthRepository repository;

  SignUpUsecase(this.repository);

  Future<void> execute(SignUpParams request) async {
    await repository.signUp(request.toRequest());
  }
}
