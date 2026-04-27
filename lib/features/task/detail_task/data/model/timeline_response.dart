import 'package:mini_project_e2e_app/features/task/detail_task/domain/entities/timeline_detail.dart';

class TimelineResponse {
  final String? startedAt;
  final String? completedAt;

  TimelineResponse({required this.startedAt, required this.completedAt});

  factory TimelineResponse.fromJson(Map<String, dynamic> json) {
    return TimelineResponse(
      startedAt: json['started_at'],
      completedAt: json['completed_at'],
    );
  }

  TimelineDetail toEntity() {
    return TimelineDetail(
      startedAt: startedAt,
      completedAt: completedAt,
    );
  }
}
