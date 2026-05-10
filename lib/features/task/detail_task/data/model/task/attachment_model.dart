import 'package:staffops/shared/entities/task/attachment.dart';

class AttachmentModel {
  final int id;
  final String fileName;
  final String fileType;
  final String filePath;

  AttachmentModel({
    required this.id,
    required this.fileName,
    required this.fileType,
    required this.filePath,
  });

  factory AttachmentModel.fromJson(Map<String, dynamic> json) {
    return AttachmentModel(
      id: json['id'],
      fileName: json['file_name'],
      fileType: json['file_type'],
      filePath: json['url'],
    );
  }

  Attachment toEntity() {
    return Attachment(
      id: id,
      fileName: fileName,
      fileType: fileType,
      filePath: filePath,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'file_name': fileName,
      'file_type': fileType,
      'url': filePath,
    };
  }
}
