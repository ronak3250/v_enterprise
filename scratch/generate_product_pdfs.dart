import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void main() async {
  // Map of product brochure name to page number (1-indexed)
  final productPages = {
    'eko_bond_combo_brochure': 3,
    'ekomilk_bond_ultra_pro_kit_brochure': 4,
    'ekomilk_ultra_pro_brochure': 5,
    'ekomilk_ultra_brochure_metal': 6,
    'smart_dpu_brochure': 7,
    'data_processing_unit_dpu_brochure': 8,
    'digital_ultrasonic_stirrer_brochure': 9,
    'platform_weighing_scale_brochure': 10,
    'mobile_dairy_app_brochure': 11,
    'dairy_portal_bochure': 12,
  };

  final frontCoverBytes = File('scratch/page_1.jpg').readAsBytesSync();
  final backCoverBytes = File('scratch/page_13.jpg').readAsBytesSync();

  final pageFormat = const PdfPageFormat(595.28, 841.89, marginAll: 0);

  for (final entry in productPages.entries) {
    final name = entry.key;
    final pageNum = entry.value;
    final productSheetBytes = File('scratch/page_$pageNum.jpg').readAsBytesSync();

    final doc = pw.Document(
      title: 'Vinit Enterprise - $name',
      author: 'Vinit Enterprise',
      creator: 'Vinit Enterprise Dairy Systems',
    );

    // Page 1: Front Cover
    doc.addPage(
      pw.Page(
        pageFormat: pageFormat,
        build: (context) => pw.FullPage(
          ignoreMargins: true,
          child: pw.Image(pw.MemoryImage(frontCoverBytes), fit: pw.BoxFit.fill),
        ),
      ),
    );

    // Page 2: Product Sheet
    doc.addPage(
      pw.Page(
        pageFormat: pageFormat,
        build: (context) => pw.FullPage(
          ignoreMargins: true,
          child: pw.Image(pw.MemoryImage(productSheetBytes), fit: pw.BoxFit.fill),
        ),
      ),
    );

    // Page 3: Back Cover
    doc.addPage(
      pw.Page(
        pageFormat: pageFormat,
        build: (context) => pw.FullPage(
          ignoreMargins: true,
          child: pw.Image(pw.MemoryImage(backCoverBytes), fit: pw.BoxFit.fill),
        ),
      ),
    );

    final pdfBytes = await doc.save();
    File('scratch/$name.pdf').writeAsBytesSync(pdfBytes);
    print('Generated scratch/$name.pdf (${pdfBytes.length} bytes)');
  }
}
