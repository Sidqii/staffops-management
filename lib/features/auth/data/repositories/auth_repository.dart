import 'package:staffops/features/auth/data/models/request/sign_in_request.dart';
import 'package:staffops/features/auth/data/models/request/sign_up_request.dart';
import 'package:staffops/shared/entities/user/user.dart';

abstract class AuthRepository {
  Future<void> signUp(SignUpRequest request);

  Future<User> signIn(SignInRequest request);

  Future<User?> getCredential();

  Future<void> signOut();
}
