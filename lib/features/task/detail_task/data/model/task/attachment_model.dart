import 'package:staffops/shared/entities/task/attachment.dart';

class AttachmentModel {
  final int id;
  final String fileName;
  final String fileType;
  final String url;

  AttachmentModel({
    required this.id,
    required this.fileName,
    required this.fileType,
    required this.url,
  });

  factory AttachmentModel.fromJson(Map<String, dynamic> json) {
    return AttachmentModel(
      id: json['id'],
      fileName: json['file_name'],
      fileType: json['file_type'],
      url: json['url'],
    );
  }

  Attachment toEntity() {
    return Attachment(id: id, fileName: fileName, fileType: fileType, url: url);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'file_name': fileName, 'file_type': fileType, 'url': url};
  }
}
