import 'package:mini_project_e2e_app/features/create_task/domain/entities/user_list.dart';

class ListOfUser {
  final int id;
  final String name;

  ListOfUser({required this.id, required this.name});

  UserList toEntity() {
    return UserList(id: id, name: name);
  }

  factory ListOfUser.fromJson(Map<String, dynamic> json) {
    return ListOfUser(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
