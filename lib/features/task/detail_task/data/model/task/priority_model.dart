import 'package:mini_project_e2e_app/shared/entities/task/priority.dart';

class PriorityModel {
  final int id;
  final String name;

  PriorityModel({required this.id, required this.name});

  factory PriorityModel.fromJson(Map<String, dynamic> json) {
    return PriorityModel(id: json['id'], name: json['name']);
  }

  Priority toEntiy() {
    return Priority(id: id, name: name);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
