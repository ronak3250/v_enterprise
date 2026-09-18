import 'dart:io';
import 'dart:convert';

void main() {
  final file = File('assets/brochures/vinit_enterprise_complete_catalog.pdf');
  final bytes = file.readAsBytesSync();
  final latin1Str = latin1.decode(bytes, allowInvalid: true);
  
  final filterRegExp = RegExp(r'/Filter\s*(\[[^\]]*\]|/[a-zA-Z0-9]+)');
  final filters = <String>{};
  for (final m in filterRegExp.allMatches(latin1Str)) {
    filters.add(m.group(0)!);
  }
  print('Filters: $filters');

  final subtypeRegExp = RegExp(r'/Subtype\s*/([a-zA-Z0-9]+)');
  final subtypes = <String>{};
  for (final m in subtypeRegExp.allMatches(latin1Str)) {
    subtypes.add(m.group(1)!);
  }
  print('Subtypes: $subtypes');

  final producerRegExp = RegExp(r'/(Producer|Creator|Title|Author)\s*\((.*?)\)');
  for (final m in producerRegExp.allMatches(latin1Str)) {
    print('${m.group(1)}: ${m.group(2)}');
  }
}
