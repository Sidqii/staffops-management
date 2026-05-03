import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

class EditedBody {
  final String? title;
  final String? description;
  final int? assignee;
  final int? priority;
  final DateTime? deadline;
  final List<PlatformFile>? files;

  EditedBody({
    this.title,
    this.description,
    this.assignee,
    this.priority,
    this.deadline,
    this.files,
  });

  Future<FormData> toFormData(List<PlatformFile> files) async {
    final formData = FormData();

    formData.fields.addAll([
      MapEntry('title', title!),
      MapEntry('description', description!),
      MapEntry('assigned_to', assignee.toString()),
      MapEntry('due_date', deadline!.toIso8601String()),
      MapEntry('priority_id', priority.toString()),
    ]);

    for (final file in files) {
      if (file.path != null) {
        final multipart = await MultipartFile.fromFile(
          file.path!,
          filename: file.name,
        );

        formData.files.add(MapEntry('files[]', multipart));
      }
    }

    return formData;
  }
}
