import 'dart:convert';

import 'package:staffops/config/storage/credential/local_data.dart';
import 'package:staffops/features/auth/data/models/response/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataImpl implements LocalData {
  final SharedPreferences prefs;

  LocalDataImpl(this.prefs);

  static const keyCredential = 'credential';

  @override
  Future<void> saveCredential(UserModel user) async {
    final jsonString = jsonEncode(user.toJson());

    await prefs.setString(keyCredential, jsonString);
  }

  @override
  Future<UserModel?> getCredential() async {
    final jsonString = prefs.getString(keyCredential);

    if (jsonString == null) return null;

    final jsonMap = jsonDecode(jsonString);

    return UserModel.fromJson(jsonMap);
  }

  @override
  Future<void> clearCredential() async {
    await prefs.remove(keyCredential);
  }
}
