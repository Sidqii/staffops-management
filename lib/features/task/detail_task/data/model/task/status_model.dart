import 'package:mini_project_e2e_app/shared/entities/task/status.dart';

class StatusModel {
  final int id;
  final String name;

  StatusModel({required this.id, required this.name});

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(id: json['id'], name: json['name']);
  }

  Status toEntiy() {
    return Status(id: id, name: name);
  }
}
