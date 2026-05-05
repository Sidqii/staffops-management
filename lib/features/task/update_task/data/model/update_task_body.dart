import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

class UpdateTaskBody {
  final String? title;
  final String? description;
  final int? assignee;
  final DateTime? deadline;
  final int? priority;

  final List<PlatformFile> files;
  final List<String> deleteId;

  UpdateTaskBody({
    this.title,
    this.description,
    this.assignee,
    this.priority,
    this.deadline,

    required this.files,
    required this.deleteId,
  });

  Future<FormData> toFormData() async {
    final formData = FormData();

    formData.fields.add(MapEntry('_method', 'PUT'));

    formData.fields.addAll([
      MapEntry('title', title!),
      MapEntry('description', description!),
      MapEntry('assigned_to', assignee.toString()),
      MapEntry('due_date', deadline!.toIso8601String()),
      MapEntry('priority_id', priority.toString()),
    ]);

    for (var id in deleteId) {
      formData.fields.add(MapEntry('delete_id[]', id));
    }

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
