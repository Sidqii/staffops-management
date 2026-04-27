import 'package:mini_project_e2e_app/features/task/detail_task/domain/entities/attachments_detail.dart';

class AttachmentsResponse {
  final int id;
  final String fileName;
  final String fileType;
  final String url;

  AttachmentsResponse({
    required this.id,
    required this.fileName,
    required this.fileType,
    required this.url,
  });

  factory AttachmentsResponse.fromJson(Map<String, dynamic> json) {
    return AttachmentsResponse(
      id: json['id'],
      fileName: json['file_name'],
      fileType: json['file_type'],
      url: json['url'],
    );
  }

  AttachmentsDetail toEntity() {
    return AttachmentsDetail(
      id: id,
      fileName: fileName,
      fileType: fileType,
      url: url,
    );
  }
}
