import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void main() async {
  final targetDir = Directory('assets/brochures');
  if (!targetDir.existsSync()) {
    targetDir.createSync(recursive: true);
  }

  // 1. Copy extracted page JPEGs to assets/brochures/
  final imageMappings = {
    'Vinit front Page.jpg': 'scratch/page_1.jpg',
    'vinit_front_page.jpg': 'scratch/page_1.jpg',
    'Vinit Index.jpg': 'scratch/page_2.jpg',
    'vinit_index.jpg': 'scratch/page_2.jpg',
    'eko_bond_combo_brochure.jpg': 'scratch/page_3.jpg',
    'ekomilk_bond_ultra_pro_kit_brochure.jpg': 'scratch/page_4.jpg',
    'ekomilk_ultra_pro_brochure.jpg': 'scratch/page_5.jpg',
    'ekomilk_ultra_brochure_metal.jpg': 'scratch/page_6.jpg',
    'ekomilk_ultra_brochure_metal.jpeg': 'scratch/page_6.jpg',
    'smart_dpu_brochure.jpg': 'scratch/page_7.jpg',
    'smart_dpu_brochure.jpeg': 'scratch/page_7.jpg',
    'data_processing_unit_dpu_brochure.jpg': 'scratch/page_8.jpg',
    'digital_ultrasonic_stirrer_brochure.jpg': 'scratch/page_9.jpg',
    'platform_weighing_scale_brochure.jpg': 'scratch/page_10.jpg',
    'mobile_dairy_app_brochure.jpg': 'scratch/page_11.jpg',
    'dairy_portal_bochure.jpg': 'scratch/page_12.jpg',
    'dairy_portal_bochure.jpeg': 'scratch/page_12.jpg',
    'vinit back cover.jpeg': 'scratch/page_13.jpg',
    'vinit back cover.jpg': 'scratch/page_13.jpg',
    'vinit_back_cover.jpeg': 'scratch/page_13.jpg',
    'vinit_back_cover.jpg': 'scratch/page_13.jpg',
  };

  for (final entry in imageMappings.entries) {
    final destFile = File('assets/brochures/${entry.key}');
    final srcFile = File(entry.value);
    if (srcFile.existsSync()) {
      destFile.writeAsBytesSync(srcFile.readAsBytesSync());
      print('Updated image: assets/brochures/${entry.key}');
    } else {
      print('Source not found: ${entry.value}');
    }
  }

  // 2. Generate 3-page standalone product PDFs into assets/brochures/
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
    File('assets/brochures/$name.pdf').writeAsBytesSync(pdfBytes);
    print('Generated assets/brochures/$name.pdf (${pdfBytes.length} bytes)');
  }

  print('All brochure assets and PDFs generated successfully!');
}
