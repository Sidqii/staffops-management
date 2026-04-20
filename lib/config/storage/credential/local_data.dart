import 'package:mini_project_e2e_app/features/auth/data/models/response/user_response.dart';

abstract class LocalData {
  Future<void> saveCredential(UserResponse user);

  Future<UserResponse?> getCredential();

  Future<void> clearCredential();
}
