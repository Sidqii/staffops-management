import 'package:staffops/features/task/detail_task/domain/entities/attachments_detail.dart';
import 'package:staffops/features/task/detail_task/domain/entities/timeline_detail.dart';

class TaskDetail {
  final int id;
  final String title;
  final String? description;
  final String status;
  final String priority;
  final String assignee;
  final String creator;
  final DateTime deadline;

  final TimelineDetail? timeline;
  final List<AttachmentsDetail> attachments;

  TaskDetail({
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
}
