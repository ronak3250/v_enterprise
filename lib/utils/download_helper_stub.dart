import 'dart:typed_data';
import 'package:url_launcher/url_launcher.dart';

Future<void> downloadBytesDirectly(Uint8List bytes, String fileName, {String mimeType = 'application/pdf'}) async {
  // Non-web stub implementation
}

Future<void> downloadAssetDirectly(String assetPath, {String? customFileName}) async {
  final uri = Uri.parse(assetPath);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

Future<void> downloadOrOpenAsset(String assetPath) async {
  final uri = Uri.parse(assetPath);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
