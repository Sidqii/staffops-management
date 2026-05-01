import 'package:mini_project_e2e_app/features/auth/data/models/response/user_model.dart';

abstract class LocalData {
  Future<void> saveCredential(UserModel user);

  Future<UserModel?> getCredential();

  Future<void> clearCredential();
}
