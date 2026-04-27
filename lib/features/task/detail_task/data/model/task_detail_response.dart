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
  final String createdBy;
  final String dueDate;

  final TimelineResponse? timeline;
  final List<AttachmentsResponse> attachments;

  TaskDetailResponse({
    required this.id,
    required this.title,
    this.description,
    required this.status,
    required this.priority,
    required this.assignee,
    required this.createdBy,
    required this.dueDate,
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
      createdBy: json['created_by']['name'],
      dueDate: json['due_date'],

      timeline: json['timeline'] != null
          ? TimelineResponse.fromJson(json['timeline'])
          : null,

      attachments: (json['attachments'] as List? ?? []).map((response) {
        return AttachmentsResponse.fromJson(response);
      }).toList(),
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
      createdBy: createdBy,
      dueDate: dueDate,
      timeline: timeline?.toEntity(),
      attachments: attachments.map((e) => e.toEntity()).toList(),
    );
  }
}
