import 'package:staffops/features/auth/data/repositories/auth_repository.dart';
import 'package:staffops/features/auth/domain/dto/sign_in_params.dart';
import 'package:staffops/shared/entities/user/user.dart';

class SignInUsecase {
  final AuthRepository repository;

  SignInUsecase(this.repository);

  Future<User> execute(SignInParams request) async {
    return await repository.signIn(request.toRequest());
  }
}
