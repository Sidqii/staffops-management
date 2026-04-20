import 'package:mini_project_e2e_app/features/auth/data/models/response/user_response.dart';

class AuthResponse {
  final String token;
  final UserResponse user;

  AuthResponse({required this.token, required this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['access_token'],
      user: UserResponse.fromJson(json['data']),
    );
  }
}
