import 'package:staffops/features/home/data/repositories/home_repository.dart';
import 'package:staffops/shared/entities/user/user.dart';

class SessionUsecase {
  final HomeRepository repository;

  SessionUsecase(this.repository);

  Future<User?> execute() {
    return repository.getCredential();
  }
}
