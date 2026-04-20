import 'package:mini_project_e2e_app/config/storage/credential/local_data.dart';
import 'package:mini_project_e2e_app/features/auth/data/datasource/auth_datasource.dart';
import 'package:mini_project_e2e_app/features/auth/data/models/request/sign_in_request.dart';
import 'package:mini_project_e2e_app/features/auth/data/models/request/sign_up_request.dart';
import 'package:mini_project_e2e_app/features/auth/data/repositories/auth_repository.dart';
import 'package:mini_project_e2e_app/features/auth/domain/entities/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;
  final LocalData localData;

  AuthRepositoryImpl(this.datasource, this.localData);

  @override
  Future<void> signUp(SignUpRequest request) async {
    await datasource.signUp(request);
  }

  @override
  Future<User> signIn(SignInRequest request) async {
    final result = await datasource.signIn(request);

    localData.saveCredential(result.user);

    return result.user.toEntity();
  }

  @override
  Future<User?> getCredential() async {
    final result = await localData.getCredential();

    if (result == null) return null;

    return result.toEntity();
  }

  @override
  Future<void> signOut() async {
    await localData.clearCredential();

    await datasource.signOut();
  }
}
