import 'package:mini_project_e2e_app/features/auth/data/models/response/role_model.dart';
import 'package:mini_project_e2e_app/shared/entities/user/user.dart';

class UserModel {
  int id;
  RoleModel? role;
  String name;
  String? email;

  UserModel({required this.id, this.role, required this.name, this.email});

  User toEntity() {
    return User(id: id, role: role?.toEntity(), name: name, email: email);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      role: RoleModel.fromJson(json['role']),
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'role': role?.toJson(), 'name': name, 'email': email};
  }
}
