import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

class CreateTaskRequest {
  final String title;
  final String description;
  final int assignee;
  final DateTime deadline;
  final int priority;

  final List<PlatformFile> files;

  CreateTaskRequest({
    required this.title,
    required this.description,
    required this.assignee,
    required this.deadline,
    required this.priority,

    required this.files,
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

    for (final file in files) {
      final multipart = await MultipartFile.fromFile(
        file.path!,
        filename: file.name,
      );

      formData.files.add(MapEntry('files[]', multipart));
    }

    return formData;
  }
}
