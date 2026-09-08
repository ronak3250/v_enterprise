import 'package:web/web.dart' as web;
import 'package:url_launcher/url_launcher.dart';

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
