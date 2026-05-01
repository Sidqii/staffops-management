import 'package:mini_project_e2e_app/features/auth/data/models/response/user_model.dart';

class AuthResponse {
  final String token;
  final UserModel user;

  AuthResponse({required this.token, required this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['access_token'],
      user: UserModel.fromJson(json['data']),
    );
  }
}
