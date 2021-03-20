import 'package:mason/mason.dart';
import 'dart:convert';
import 'dart:io';

generateTemplate() async {
  final contents =
      await File('lib/src/template/files/pubspec.yaml').readAsString();

  var bytes = utf8.encode(contents);
  final pubspec = base64.encode(bytes);

  return MasonBundle.fromJson(
    {
      "files": [
        {"path": "pubspec.yaml", "data": pubspec, "type": "text"}
      ]
    },
  );
}
