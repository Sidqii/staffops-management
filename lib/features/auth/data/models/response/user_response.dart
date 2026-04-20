import 'package:mini_project_e2e_app/features/auth/data/models/response/role_response.dart';
import 'package:mini_project_e2e_app/features/auth/domain/entities/user.dart';

class UserResponse {
  int id;
  RoleResponse role;
  String name;
  String email;

  UserResponse({
    required this.id,
    required this.role,
    required this.name,
    required this.email,
  });

  User toEntity() {
    return User(id: id, role: role.toEntity(), name: name, email: email);
  }

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'],
      role: RoleResponse.fromJson(json['role']),
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'role': role.toJson(), 'name': name, 'email': email};
  }
}
