import 'package:mini_project_e2e_app/features/task/detail_task/domain/entities/timeline_detail.dart';

class TimelineResponse {
  final DateTime? startedAt;
  final DateTime? completedAt;

  TimelineResponse({required this.startedAt, required this.completedAt});

  factory TimelineResponse.fromJson(Map<String, dynamic> json) {
    return TimelineResponse(
      startedAt: json['started_at'] != null
          ? DateTime.tryParse(json['started_at'])
          : null,
      completedAt: json['completed_at'] != null
          ? DateTime.tryParse(json['completed_at'])
          : null,
    );
  }

  TimelineDetail toEntity() {
    return TimelineDetail(startedAt: startedAt, completedAt: completedAt);
  }
}
