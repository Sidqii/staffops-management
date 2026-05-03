import 'package:flutter/material.dart';
import 'package:staffops/features/task/create_task/presentation/utils/file_item.dart';
import 'package:staffops/shared/themes/app_color.dart';

class UploadFilesOrImages extends StatelessWidget {
  final String hintText;
  final List<FileItem> files;
  final VoidCallback onTap;
  final Function(FileItem file)? onRemove;

  const UploadFilesOrImages({
    super.key,
    required this.hintText,
    required this.files,
    required this.onTap,
    this.onRemove,
  });

  static const uploadFiles = Icon(Icons.cloud_upload_rounded);
  static const uploadedFiles = Icon(Icons.cloud_done_rounded);

  @override
  Widget build(BuildContext context) {
    if (files.isEmpty) {
      return GestureDetector(onTap: onTap, child: _containerUploadPanel());
    }

    return _fileListPanel();
  }

  Widget _containerUploadPanel() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),

      decoration: BoxDecoration(
        border: Border.all(color: AppColor.grey900),
        borderRadius: BorderRadius.circular(15),
      ),

      child: Column(
        children: [
          Icon(uploadFiles.icon, color: AppColor.grey600, size: 30),
          Text(hintText),
        ],
      ),
    );
  }

  Widget _fileItemPanel(FileItem file) {
    return ListTile(
      contentPadding: EdgeInsets.zero,

      leading: const Icon(Icons.insert_drive_file_rounded),

      title: Text(file.name, overflow: TextOverflow.ellipsis),

      trailing: IconButton(
        icon: const Icon(Icons.remove_outlined),
        onPressed: () => onRemove?.call(file),
      ),
    );
  }

  Widget _fileListPanel() {
    return Column(
      children: [
        ...files.map((e) => _fileItemPanel(e)),

        ListTile(
          leading: const Icon(Icons.add),
          title: const Text('Add more files.'),
          onTap: onTap,
        ),
      ],
    );
  }
}
