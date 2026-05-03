import 'package:staffops/shared/entities/user/role.dart';

class RoleModel {
  final int id;
  final String name;

  RoleModel({required this.id, required this.name});

  Role toEntity(){
    return Role(id: id, name: name);
  }

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(id: json['id'], name: json['name']);
  }

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'name':name
    };
  }
}
