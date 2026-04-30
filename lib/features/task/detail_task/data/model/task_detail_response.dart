import 'package:mini_project_e2e_app/features/task/detail_task/data/model/attachments_response.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/data/model/timeline_response.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/domain/entities/task_detail.dart';

class TaskDetailResponse {
  final int id;
  final String title;
  final String? description;
  final String status;
  final String priority;
  final String assignee;
  final String creator;
  final DateTime deadline;

  final TimelineResponse? timeline;
  final List<AttachmentsResponse> attachments;

  TaskDetailResponse({
    required this.id,
    required this.title,
    this.description,
    required this.status,
    required this.priority,
    required this.assignee,
    required this.creator,
    required this.deadline,
    this.timeline,
    required this.attachments,
  });

  factory TaskDetailResponse.fromJson(Map<String, dynamic> json) {
    return TaskDetailResponse(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status']['name'],
      priority: json['priority']['name'],
      assignee: json['assignee']['name'],
      creator: json['created_by']['name'],
      deadline: json['due_date'] != null
          ? DateTime.parse(json['due_date'])
          : json['due_date'],

      timeline: json['timeline'] != null
          ? TimelineResponse.fromJson(json['timeline'])
          : null,

      attachments: (json['attachments'] as List? ?? [])
          .map((e) => AttachmentsResponse.fromJson(e))
          .toList(),
    );
  }

  TaskDetail toEntity() {
    return TaskDetail(
      id: id,
      title: title,
      description: description,
      status: status,
      priority: priority,
      assignee: assignee,
      creator: creator,
      deadline: deadline,
      timeline: timeline?.toEntity(),
      attachments: attachments.map((e) => e.toEntity()).toList(),
    );
  }
}
