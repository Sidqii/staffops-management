import 'package:mini_project_e2e_app/features/auth/domain/entities/user.dart';
import 'package:mini_project_e2e_app/features/home/data/repositories/home_repository.dart';

class SessionUsecase {
  final HomeRepository repository;

  SessionUsecase(this.repository);

  Future<User?> execute() {
    return repository.getCredential();
  }
}
