import 'package:mini_project_e2e_app/features/task/create_task/domain/entities/priority_list.dart';

class ListOfPriority {
  final int id;
  final String name;

  ListOfPriority({required this.id, required this.name});

  PriorityList toEntity() {
    return PriorityList(id: id, name: name);
  }

  factory ListOfPriority.fromJson(Map<String, dynamic> json) {
    return ListOfPriority(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
