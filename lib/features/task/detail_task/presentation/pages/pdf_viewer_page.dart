import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerPage extends StatelessWidget {
  final String filePath;

  const PdfViewerPage({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    final file = File(filePath);
    final fileName = file.path.split('/').last;

    return Scaffold(
      appBar: AppBar(title: Text(fileName)),
      body: SfPdfViewer.file(file),
    );
  }
}
