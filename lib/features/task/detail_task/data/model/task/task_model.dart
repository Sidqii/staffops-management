import 'package:staffops/features/task/detail_task/data/model/actor/actor_model.dart';
import 'package:staffops/features/task/detail_task/data/model/task/attachment_model.dart';
import 'package:staffops/features/task/detail_task/data/model/task/priority_model.dart';
import 'package:staffops/features/task/detail_task/data/model/task/status_model.dart';
import 'package:staffops/features/task/detail_task/data/model/task/timeline_model.dart';
import 'package:staffops/shared/entities/task/task.dart';

class TaskModel {
  final int id;
  final String title;
  final String? description;

  final StatusModel status;
  final PriorityModel priority;

  final ActorModel assignee;
  final ActorModel creator;

  final DateTime deadline;

  final TimelineModel? timeline;
  final List<AttachmentModel> attachment;

  TaskModel({
    required this.id,
    required this.title,
    this.description,
    required this.status,
    required this.priority,
    required this.assignee,
    required this.creator,
    required this.deadline,
    this.timeline,
    required this.attachment,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],

      status: StatusModel.fromJson(json['status']),
      priority: PriorityModel.fromJson(json['priority']),

      assignee: ActorModel.fromJson(json['assignee']),
      creator: ActorModel.fromJson(json['created_by']),
      deadline: DateTime.parse(json['due_date']),

      attachment: (json['attachments'] as List? ?? [])
          .map((e) => AttachmentModel.fromJson(e))
          .toList(),
      timeline: json['timeline'] != null
          ? TimelineModel.fromJson(json['timeline'])
          : null,
    );
  }

  Task toEntity() {
    return Task(
      id: id,
      title: title,
      description: description,
      status: status.toEntiy(),
      priority: priority.toEntiy(),
      assignee: assignee.toEntity(),
      creator: creator.toEntity(),
      deadline: deadline,
      attachment: attachment.map((e) => e.toEntity()).toList(),
      timeline: timeline?.toEntiy(),
    );
  }
}
