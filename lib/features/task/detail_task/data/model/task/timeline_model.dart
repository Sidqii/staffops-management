import 'package:staffops/shared/entities/task/timeline.dart';

class TimelineModel {
  final DateTime? started;
  final DateTime? completed;

  TimelineModel({required this.started, required this.completed});

  factory TimelineModel.fromJson(Map<String, dynamic> json) {
    return TimelineModel(
      started: json['started_at'] != null
          ? DateTime.tryParse(json['started_at'])
          : null,
      completed: json['completed_at'] != null
          ? DateTime.tryParse(json['completed_at'])
          : null,
    );
  }

  Timeline toEntiy() {
    return Timeline(started: started, completed: completed);
  }
}
