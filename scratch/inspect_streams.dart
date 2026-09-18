import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

void main() {
  final file = File('assets/brochures/vinit_enterprise_complete_catalog.pdf');
  final bytes = file.readAsBytesSync();
  final latin1Str = latin1.decode(bytes, allowInvalid: true);
  
  // Find objects with streams
  final objRegExp = RegExp(r'(\d+)\s+(\d+)\s+obj\r?\n(.*?)\r?\nstream\r?\n', dotAll: true);
  for (final match in objRegExp.allMatches(latin1Str)) {
    final objNum = match.group(1);
    final header = match.group(3)!;
    if (header.contains('/Subtype') || header.contains('/Filter')) {
      print('Obj $objNum: $header\n---');
    }
  }
}
