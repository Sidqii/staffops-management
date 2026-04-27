import 'package:dio/dio.dart';

class CreateTaskRequest {
  final String title;
  final String description;
  final int assignedTo;
  final DateTime dueDate;
  final int priorityId;

  final List<String> filePath;

  CreateTaskRequest({
    required this.title,
    required this.description,
    required this.assignedTo,
    required this.dueDate,
    required this.priorityId,

    required this.filePath,
  });

  Future<FormData> toFormData() async {
    final formData = FormData();

    formData.fields.addAll([
      MapEntry('title', title),
      MapEntry('description', description),
      MapEntry('assigned_to', assignedTo.toString()),
      MapEntry('due_date', dueDate.toIso8601String()),
      MapEntry('priority_id', priorityId.toString()),
    ]);

    for (final path in filePath) {
      formData.files.add(
        MapEntry('files[]', await MultipartFile.fromFile(path)),
      );
    }

    return formData;
  }
}
