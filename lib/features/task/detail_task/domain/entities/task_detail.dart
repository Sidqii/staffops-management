import 'package:mini_project_e2e_app/features/task/detail_task/domain/entities/attachments_detail.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/domain/entities/timeline_detail.dart';

class TaskDetail {
  final int id; // done
  final String title; // done
  final String? description; // done
  final String status; // done
  final String priority;
  final String assignee;
  final String createdBy;
  final String dueDate; // done

  final TimelineDetail? timeline; // done
  final List<AttachmentsDetail> attachments;

  TaskDetail({
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
}
