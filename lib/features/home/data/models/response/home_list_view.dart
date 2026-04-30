import 'package:mini_project_e2e_app/features/home/domain/entities/dashboard.dart';

class HomeListView {
  final int id;
  final String title;
  final String? description;
  final String status;
  final String priority;
  final String assignee;
  final String creator;
  final String deadline;
  final String? started;
  final String? completed;

  HomeListView({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.assignee,
    required this.creator,
    required this.deadline,
    required this.started,
    required this.completed,
  });

  factory HomeListView.fromJson(Map<String, dynamic> json) {
    return HomeListView(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status']['name'],
      priority: json['priority']['name'],
      assignee: json['assignee']['name'],
      creator: json['created_by']['name'],
      deadline: json['due_date'],
      started: json['timeline']['started_at'],
      completed: json['timeline']['completed_at'],
    );
  }

  Dashboard toEntity() {
    return Dashboard(
      id: id,
      title: title,
      description: description,
      status: status,
      priority: priority,
      assignee: assignee,
      creator: creator,
      deadline: deadline,
      started: started,
      completed: completed,
    );
  }
}
