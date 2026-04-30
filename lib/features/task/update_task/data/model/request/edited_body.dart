import 'package:mini_project_e2e_app/features/task/detail_task/data/model/attachments_response.dart';

class EditedBody {
  final String? title;
  final String? description;
  final int? assignee;
  final int? priority;
  final DateTime? deadline;

  final List<AttachmentsResponse>? attachment;

  EditedBody({
    this.title,
    this.description,
    this.assignee,
    this.priority,
    this.deadline,
    this.attachment,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (title != null) data['title'] = title;
    if (description != null) data['description'] = description;
    if (assignee != null) data['assignee'] = assignee;
    if (priority != null) data['priority'] = priority;
    if (deadline != null) data['due_date'] = deadline?.toIso8601String();
    if (attachment != null) {
      data['attachment'] = attachment!.map((e) => e.toJson()).toList();
    }

    return data;
  }
}
