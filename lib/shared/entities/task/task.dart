import 'package:mini_project_e2e_app/shared/entities/task/attachment.dart';
import 'package:mini_project_e2e_app/shared/entities/task/priority.dart';
import 'package:mini_project_e2e_app/shared/entities/task/status.dart';
import 'package:mini_project_e2e_app/shared/entities/task/timeline.dart';
import 'package:mini_project_e2e_app/shared/entities/user/user.dart';

class Task {
  final int id;
  final String title;
  final String? description;
  final Status status;
  final Priority priority;
  final User assignee;
  final User creator;
  final DateTime deadline;
  final Timeline? timeline;
  final List<Attachment>? attachment;

  Task({
    required this.id,
    required this.title,
    this.description,
    required this.status,
    required this.priority,
    required this.assignee,
    required this.creator,
    required this.deadline,
    this.timeline,
    this.attachment,
  });
}
