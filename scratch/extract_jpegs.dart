import 'dart:io';
import 'dart:typed_data';

void main() {
  final file = File('assets/brochures/vinit_enterprise_complete_catalog.pdf');
  final bytes = file.readAsBytesSync();
  
  // Find streams in the PDF
  final streamStartStr = 'stream\r\n';
  final streamStartStrUnix = 'stream\n';
  final streamEndStr = 'endstream';
  
  final imageObjs = [4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34, 37, 40];
  
  for (int i = 0; i < imageObjs.length; i++) {
    final objNum = imageObjs[i];
    final headerMarker = '$objNum 0 obj';
    final objIdx = _indexOf(bytes, headerMarker.codeUnits);
    if (objIdx == -1) {
      print('Could not find obj $objNum');
      continue;
    }
    
    int streamStart = _indexOf(bytes, streamStartStr.codeUnits, objIdx);
    int streamContentStart = streamStart + streamStartStr.length;
    if (streamStart == -1) {
      streamStart = _indexOf(bytes, streamStartStrUnix.codeUnits, objIdx);
      streamContentStart = streamStart + streamStartStrUnix.length;
    }
    
    final streamEnd = _indexOf(bytes, streamEndStr.codeUnits, streamContentStart);
    
    final compressedStream = bytes.sublist(streamContentStart, streamEnd);
    print('Page ${i + 1} (obj $objNum) compressed stream size: ${compressedStream.length}');
    
    try {
      final decompressed = zlib.decode(compressedStream);
      print('Page ${i + 1} decompressed size: ${decompressed.length}, first bytes: ${decompressed.take(4).map((b) => b.toRadixString(16)).toList()}');
      // In JPEG, first two bytes are 0xFF, 0xD8
      if (decompressed[0] == 0xFF && decompressed[1] == 0xD8) {
        print('Page ${i + 1} is valid JPEG!');
        File('scratch/page_${i + 1}.jpg').writeAsBytesSync(decompressed);
      }
    } catch (e) {
      print('Error decompressing obj $objNum: $e');
    }
  }
}

int _indexOf(List<int> haystack, List<int> needle, [int start = 0]) {
  for (int i = start; i <= haystack.length - needle.length; i++) {
    bool match = true;
    for (int j = 0; j < needle.length; j++) {
      if (haystack[i + j] != needle[j]) {
        match = false;
        break;
      }
    }
    if (match) return i;
  }
  return -1;
}
