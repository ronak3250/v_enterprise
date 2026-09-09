import 'dart:js_interop';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:web/web.dart' as web;
import 'package:url_launcher/url_launcher.dart';

Future<void> downloadBytesDirectly(Uint8List bytes, String fileName, {String mimeType = 'application/pdf'}) async {
  try {
    final jsArray = bytes.toJS;
    final blob = web.Blob([jsArray].toJS, web.BlobPropertyBag(type: mimeType));
    final url = web.URL.createObjectURL(blob);
    final anchor = web.HTMLAnchorElement()
      ..href = url
      ..target = '_blank'
      ..download = fileName;
    web.document.body?.appendChild(anchor);
    anchor.click();
    anchor.remove();
    web.URL.revokeObjectURL(url);
  } catch (_) {
    final resolvedUrl = Uri.base.resolve(fileName).toString();
    final anchor = web.HTMLAnchorElement()
      ..href = resolvedUrl
      ..target = '_blank'
      ..download = fileName;
    web.document.body?.appendChild(anchor);
    anchor.click();
    anchor.remove();
  }
}

Future<void> downloadAssetDirectly(String assetPath, {String? customFileName}) async {
  final fileName = customFileName ?? assetPath.split('/').last;
  try {
    final byteData = await rootBundle.load(assetPath);
    final bytes = byteData.buffer.asUint8List();
    String mimeType = 'application/pdf';
    if (assetPath.endsWith('.jpg') || assetPath.endsWith('.jpeg')) {
      mimeType = 'image/jpeg';
    } else if (assetPath.endsWith('.png')) {
      mimeType = 'image/png';
    }
    await downloadBytesDirectly(bytes, fileName, mimeType: mimeType);
  } catch (_) {
    await downloadOrOpenAsset(assetPath);
  }
}

Future<void> downloadOrOpenAsset(String assetPath) async {
  try {
    final resolvedUrl = Uri.base.resolve(assetPath).toString();
    final fileName = assetPath.split('/').last;
    final anchor = web.HTMLAnchorElement()
      ..href = resolvedUrl
      ..target = '_blank'
      ..download = fileName;
    web.document.body?.appendChild(anchor);
    anchor.click();
    anchor.remove();
  } catch (_) {
    final uri = Uri.base.resolve(assetPath);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
