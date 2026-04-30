import 'package:dio/dio.dart';

class CreateTaskRequest {
  final String title;
  final String description;
  final int assignee;
  final DateTime deadline;
  final int priority;

  final List<String> filePath;

  CreateTaskRequest({
    required this.title,
    required this.description,
    required this.assignee,
    required this.deadline,
    required this.priority,

    required this.filePath,
  });

  Future<FormData> toFormData() async {
    final formData = FormData();

    formData.fields.addAll([
      MapEntry('title', title),
      MapEntry('description', description),
      MapEntry('assigned_to', assignee.toString()),
      MapEntry('due_date', deadline.toIso8601String()),
      MapEntry('priority_id', priority.toString()),
    ]);

    for (final path in filePath) {
      formData.files.add(
        MapEntry('files[]', await MultipartFile.fromFile(path)),
      );
    }

    return formData;
  }
}
