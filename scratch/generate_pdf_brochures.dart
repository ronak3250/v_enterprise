import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void main() async {
  print('Generating 300 DPI Ultra High-Quality PDF brochure files...');
  
  final brochureDir = Directory('assets/brochures');
  if (!brochureDir.existsSync()) {
    print('Error: assets/brochures directory does not exist');
    return;
  }

  final imageFiles = brochureDir
      .listSync()
      .whereType<File>()
      .where((f) => f.path.endsWith('.jpg') || f.path.endsWith('.jpeg') || f.path.endsWith('.png'))
      .toList();

  imageFiles.sort((a, b) => a.path.compareTo(b.path));

  print('Processing ${imageFiles.length} brochure sheet images at 300 DPI high resolution...');

  // 1. Generate individual 300 DPI High-Quality PDF for each brochure sheet
  for (final file in imageFiles) {
    final pdf = pw.Document();
    final bytes = file.readAsBytesSync();
    final pdfImage = pw.MemoryImage(bytes, dpi: 300);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.zero,
        build: (pw.Context context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Center(
              child: pw.Image(pdfImage, fit: pw.BoxFit.contain, dpi: 300),
            ),
          );
        },
      ),
    );

    final baseName = file.uri.pathSegments.last.replaceAll(RegExp(r'\.(jpg|jpeg|png)$'), '');
    final pdfFile = File('assets/brochures/$baseName.pdf');
    await pdfFile.writeAsBytes(await pdf.save());
    print('Generated 300 DPI High-Quality PDF: ${pdfFile.path} (${pdfFile.lengthSync()} bytes)');
  }

  // 2. Generate Complete Multi-Page 300 DPI High-Quality PDF Catalog
  final catalogPdf = pw.Document(
    title: 'Vinit Enterprise Complete Product Catalog',
    author: 'Vinit Enterprise',
  );

  for (final file in imageFiles) {
    final bytes = file.readAsBytesSync();
    final pdfImage = pw.MemoryImage(bytes, dpi: 300);

    catalogPdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.zero,
        build: (pw.Context context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Center(
              child: pw.Image(pdfImage, fit: pw.BoxFit.contain, dpi: 300),
            ),
          );
        },
      ),
    );
  }

  final fullCatalogFile = File('assets/brochures/vinit_enterprise_complete_catalog.pdf');
  await fullCatalogFile.writeAsBytes(await catalogPdf.save());
  print('SUCCESS: Generated 300 DPI Full Catalog PDF at: ${fullCatalogFile.path} (${fullCatalogFile.lengthSync()} bytes)');
}
