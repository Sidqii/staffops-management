import 'package:staffops/features/auth/data/models/request/sign_in_request.dart';
import 'package:staffops/features/auth/data/models/request/sign_up_request.dart';
import 'package:staffops/features/auth/data/models/response/auth_response.dart';

abstract class AuthDatasource {
  Future<void> signUp(SignUpRequest request);

  Future<AuthResponse> signIn(SignInRequest request);

  Future<void> signOut();
}
