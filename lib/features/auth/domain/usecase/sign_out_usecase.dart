import 'package:staffops/features/auth/data/repositories/auth_repository.dart';

class SignOutUsecase {
  final AuthRepository repository;

  SignOutUsecase(this.repository);

  Future<void> execute() async {
    await repository.signOut();
  }
}
