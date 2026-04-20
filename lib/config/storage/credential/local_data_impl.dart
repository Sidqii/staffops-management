import 'dart:convert';

import 'package:mini_project_e2e_app/config/storage/credential/local_data.dart';
import 'package:mini_project_e2e_app/features/auth/data/models/response/user_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataImpl implements LocalData {
  final SharedPreferences prefs;

  LocalDataImpl(this.prefs);

  static const keyCredential = 'credential';

  @override
  Future<void> saveCredential(UserResponse user) async {
    final jsonString = jsonEncode(user.toJson());

    await prefs.setString(keyCredential, jsonString);
  }

  @override
  Future<UserResponse?> getCredential() async {
    final jsonString = prefs.getString(keyCredential);

    if (jsonString == null) return null;

    final jsonMap = jsonDecode(jsonString);

    return UserResponse.fromJson(jsonMap);
  }

  @override
  Future<void> clearCredential() async {
    await prefs.remove(keyCredential);
  }
}
