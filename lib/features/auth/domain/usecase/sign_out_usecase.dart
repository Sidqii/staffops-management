import 'package:mini_project_e2e_app/features/auth/data/repositories/auth_repository.dart';

class SignOutUsecase {
  final AuthRepository repository;

  SignOutUsecase(this.repository);

  Future<void> execute() async {
    await repository.signOut();
  }
}
