import 'package:flutter/material.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class UploadFilesOrImages extends StatelessWidget {
  final String hintText;
  final String? fileName;
  final VoidCallback onTap;

  const UploadFilesOrImages({
    super.key,
    required this.hintText,
    required this.onTap,
    this.fileName,
  });

  static const uploadFiles = Icon(Icons.cloud_upload_rounded);
  static const uploadedFiles = Icon(Icons.cloud_done_rounded);

  @override
  Widget build(BuildContext context) {
    final isEmpty = fileName == null;

    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 12),

        decoration: BoxDecoration(
          border: Border.all(color: AppColor.grey600),
          borderRadius: BorderRadius.circular(15),
        ),

        child: isEmpty ? _uploadFilesContent() : _uploadedFilesContent(),
      ),
    );
  }

  Widget _uploadFilesContent() {
    return Column(
      children: [
        Icon(uploadFiles.icon, color: AppColor.grey600, size: 30),

        Text(hintText),
      ],
    );
  }

  Widget _uploadedFilesContent() {
    return Column(
      children: [
        Icon(uploadedFiles.icon, color: AppColor.grey600, size: 30),

        Expanded(child: Text(fileName!, overflow: TextOverflow.ellipsis)),
      ],
    );
  }
}
