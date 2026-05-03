import 'package:staffops/shared/entities/user/role.dart';
import 'package:staffops/shared/entities/user/user.dart';

class ActorModel {
  final int id;
  final String name;
  final Role? role;

  ActorModel({required this.id, required this.name, this.role});

  factory ActorModel.fromJson(Map<String, dynamic> json) {
    return ActorModel(id: json['id'], name: json['name']);
  }

  User toEntity() {
    return User(id: id, name: name);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
