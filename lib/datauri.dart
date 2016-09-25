import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:mime/mime.dart' as mime;

class DataUriGen {
  String path;
  String get mimeType => mime.lookupMimeType(path);
  File get source => new File(path);

  DataUriGen(this.path);

  Future<String> read() => new Future(() async {
    var data = await source.readAsBytes();
    var base64Data = BASE64.encode(data);
    return "data:$mimeType;base64,$base64Data";
  });
}
