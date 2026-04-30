import 'package:mini_project_e2e_app/features/task/create_task/data/model/response/priority_response.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/model/response/user_response.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/data/model/attachments_response.dart';

class UpdatedTaskResponse {
  final int id; // unedited
  final String title; // unedited
  final String? description;
  final PriorityResponse priority;
  final UserResponse assignee;
  final UserResponse creator; // unedited
  final DateTime deadline;
  final String status; // unedited

  final List<AttachmentsResponse>? attachment;

  UpdatedTaskResponse({
    required this.id,
    required this.title,
    this.description,
    required this.priority,
    required this.assignee,
    required this.creator,
    required this.deadline,
    required this.status,
    this.attachment,
  });

  factory UpdatedTaskResponse.fromJson(Map<String, dynamic> json) {
    return UpdatedTaskResponse(
      id: json['id'],
      title: json['title'],
      description: json['description'],

      priority: PriorityResponse.fromJson(json['priority']),
      assignee: UserResponse.fromJson(json['assignee']),
      creator: UserResponse.fromJson(json['created_by']),

      deadline: DateTime.parse(json['due_date']),

      status: json['status']['name'],

      attachment: (json['attachments'] as List?)
          ?.map((response) => AttachmentsResponse.fromJson(response))
          .toList(),
    );
  }
}
