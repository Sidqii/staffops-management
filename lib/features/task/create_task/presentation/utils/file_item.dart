import 'package:file_picker/file_picker.dart';

class FileItem {
  final String name;
  final String? id; // ada kalau dari server
  final PlatformFile? file; // ada kalau dari local

  FileItem({required this.name, this.id, this.file});
}
