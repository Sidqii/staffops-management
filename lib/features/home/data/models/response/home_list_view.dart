import 'package:mini_project_e2e_app/features/home/domain/entities/dashboard.dart';

class HomeListView {
  final int id;
  final String title;
  final String? description;
  final String status;

  HomeListView({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
  });

  factory HomeListView.fromJson(Map<String, dynamic> json) {
    return HomeListView(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status']['name'],
    );
  }

  Dashboard toEntity() {
    return Dashboard(
      id: id,
      title: title,
      description: description,
      status: status,
    );
  }
}
