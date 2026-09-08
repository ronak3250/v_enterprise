import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void main() async {
  print('Generating PDF brochure files...');
  
  final brochureDir = Directory('assets/brochures');
  if (!brochureDir.existsSync()) {
    print('Error: assets/brochures directory does not exist');
    return;
  }

  // Get image files in assets/brochures
  final imageFiles = brochureDir
      .listSync()
      .whereType<File>()
      .where((f) => f.path.endsWith('.jpg') || f.path.endsWith('.jpeg') || f.path.endsWith('.png'))
      .toList();

  imageFiles.sort((a, b) => a.path.compareTo(b.path));

  print('Found ${imageFiles.length} brochure sheet images.');

  // 1. Generate individual PDF for each image
  for (final file in imageFiles) {
    final pdf = pw.Document();
    final imageBytes = file.readAsBytesSync();
    final pdfImage = pw.MemoryImage(imageBytes);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.zero,
        build: (pw.Context context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Center(
              child: pw.Image(pdfImage, fit: pw.BoxFit.contain),
            ),
          );
        },
      ),
    );

    final baseName = file.uri.pathSegments.last.replaceAll(RegExp(r'\.(jpg|jpeg|png)$'), '');
    final pdfFile = File('assets/brochures/$baseName.pdf');
    await pdfFile.writeAsBytes(await pdf.save());
    print('Generated individual PDF: ${pdfFile.path}');
  }

  // 2. Generate Complete Multi-Page PDF Catalog containing ALL brochure sheets
  final catalogPdf = pw.Document(
    title: 'Vinit Enterprise Complete Product Catalog',
    author: 'Vinit Enterprise',
  );

  for (final file in imageFiles) {
    final imageBytes = file.readAsBytesSync();
    final pdfImage = pw.MemoryImage(imageBytes);

    catalogPdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.zero,
        build: (pw.Context context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Center(
              child: pw.Image(pdfImage, fit: pw.BoxFit.contain),
            ),
          );
        },
      ),
    );
  }

  final fullCatalogFile = File('assets/brochures/vinit_enterprise_complete_catalog.pdf');
  await fullCatalogFile.writeAsBytes(await catalogPdf.save());
  print('SUCCESS: Generated full catalog PDF at: ${fullCatalogFile.path} (${fullCatalogFile.lengthSync()} bytes)');
}
