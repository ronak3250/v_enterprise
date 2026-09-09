import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:vinit_enterprise/models/product_model.dart';
import 'package:vinit_enterprise/utils/download_helper.dart';

class PdfService {
  /// All 13 official brochure page assets in exact sequence
  static const List<String> fullCatalogPagePaths = [
    'assets/brochures/Vinit front Page.jpg',
    'assets/brochures/Vinit Index.jpg',
    'assets/brochures/eko_bond_combo_brochure.jpg',
    'assets/brochures/ekomilk_bond_ultra_pro_kit_brochure.jpg',
    'assets/brochures/ekomilk_ultra_pro_brochure.jpg',
    'assets/brochures/ekomilk_ultra_brochure_metal.jpg',
    'assets/brochures/smart_dpu_brochure.jpg',
    'assets/brochures/data_processing_unit_dpu_brochure.jpg',
    'assets/brochures/digital_ultrasonic_stirrer_brochure.jpg',
    'assets/brochures/platform_weighing_scale_brochure.jpg',
    'assets/brochures/mobile_dairy_app_brochure.jpg',
    'assets/brochures/dairy_portal_bochure.jpg',
    'assets/brochures/vinit back cover.jpeg',
  ];

  /// Generates and triggers direct download of a single product PDF brochure
  /// (Front Cover + Product Official Sheet + Back Cover)
  static Future<void> downloadProductPdf(Product product) async {
    final pdf = pw.Document(
      title: '${product.title} - Official Brochure',
      author: 'Vinit Enterprise',
      creator: 'Vinit Enterprise Dairy Systems',
    );

    final pagesToLoad = <String>[
      'assets/brochures/Vinit front Page.jpg',
      if (product.brochurePath.isNotEmpty) product.brochurePath,
      'assets/brochures/vinit back cover.jpeg',
    ];

    bool addedAnyPage = false;

    for (final path in pagesToLoad) {
      try {
        final byteData = await rootBundle.load(path);
        final imageBytes = byteData.buffer.asUint8List();
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
        addedAnyPage = true;
      } catch (_) {}
    }

    // Fallback if image asset fails to load
    if (!addedAnyPage) {
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(32),
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                  padding: const pw.EdgeInsets.all(16),
                  decoration: pw.BoxDecoration(
                    color: PdfColor.fromHex('#0072CE'),
                    borderRadius: pw.BorderRadius.circular(8),
                  ),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'VINIT ENTERPRISE',
                        style: pw.TextStyle(color: PdfColors.white, fontSize: 20, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text(
                        'PRODUCT BROCHURE',
                        style: pw.TextStyle(color: PdfColors.white, fontSize: 12, fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                  product.title,
                  style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex('#0A2540')),
                ),
                pw.SizedBox(height: 10),
                pw.Text(product.overview, style: const pw.TextStyle(fontSize: 11)),
                pw.SizedBox(height: 20),
                pw.Text('TECHNICAL SPECIFICATIONS', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex('#0072CE'))),
                pw.SizedBox(height: 8),
                pw.Table(
                  border: pw.TableBorder.all(color: PdfColors.grey300),
                  children: product.specs
                      .map(
                        (spec) => pw.TableRow(
                          children: [
                            pw.Padding(padding: const pw.EdgeInsets.all(6), child: pw.Text(spec.label, style: const pw.TextStyle(fontSize: 10))),
                            pw.Padding(padding: const pw.EdgeInsets.all(6), child: pw.Text(spec.value, style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold))),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ],
            );
          },
        ),
      );
    }

    final bytes = await pdf.save();
    final sanitizeTitle = product.title.replaceAll(RegExp(r'[^a-zA-Z0-9_\-]'), '_');
    final fileName = '${sanitizeTitle}_Official_Brochure.pdf';

    await downloadBytesDirectly(bytes, fileName, mimeType: 'application/pdf');
  }

  /// Generates and triggers direct download of the full 13-page corporate catalog PDF
  static Future<void> downloadFullCatalogPdf(List<Product> products) async {
    final pdf = pw.Document(
      title: 'Vinit Enterprise - Complete Corporate Catalog',
      author: 'Vinit Enterprise',
      creator: 'Vinit Enterprise Dairy Systems',
    );

    int loadedCount = 0;

    for (final path in fullCatalogPagePaths) {
      try {
        final byteData = await rootBundle.load(path);
        final imageBytes = byteData.buffer.asUint8List();
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
        loadedCount++;
      } catch (_) {}
    }

    if (loadedCount == 0) {
      // Fallback text page if assets unavailable
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (context) => pw.Center(
            child: pw.Text('Vinit Enterprise Complete Dairy Catalog'),
          ),
        ),
      );
    }

    final bytes = await pdf.save();
    await downloadBytesDirectly(bytes, 'Vinit_Enterprise_Complete_Catalog.pdf', mimeType: 'application/pdf');
  }
}
