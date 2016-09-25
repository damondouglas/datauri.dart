import 'dart:io';
import 'dart:async';
import 'package:datauri/datauri.dart';

final usage = "datauri.dart <path>";

Future main(List<String> args) async {
  if (args.length < 1) {
    print(usage);
    exit(1);
  }

  var path = args[0];

  var gen = new DataUriGen(path);

  var uri = await gen.read();
  print(uri);
}
