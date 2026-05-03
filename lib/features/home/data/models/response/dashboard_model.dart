import 'package:staffops/features/home/domain/entities/dashboard.dart';

class DashboardModel {
  final int id;
  final String title;
  final String? description;
  final String status;

  DashboardModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
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
