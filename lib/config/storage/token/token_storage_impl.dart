import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:staffops/config/storage/token/token_storage.dart';

class TokenStorageImpl implements TokenStorage {
  final FlutterSecureStorage secureStorage;

  static const _tokenKey = 'auth_token';

  TokenStorageImpl(this.secureStorage);

  @override
  Future<void> saveToken(String token) async {
    await secureStorage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await secureStorage.read(key: _tokenKey);
  }

  @override
  Future<void> clearToken() async {
    await secureStorage.delete(key: _tokenKey);
  }
}
