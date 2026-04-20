import 'package:mini_project_e2e_app/features/auth/domain/entities/role.dart';

class RoleResponse {
  final int id;
  final String name;

  RoleResponse({required this.id, required this.name});

  Role toEntity(){
    return Role(id: id, name: name);
  }

  factory RoleResponse.fromJson(Map<String, dynamic> json) {
    return RoleResponse(id: json['id'], name: json['name']);
  }

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'name':name
    };
  }
}
