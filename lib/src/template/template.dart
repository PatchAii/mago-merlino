import 'package:mason/mason.dart';
import 'dart:convert';
import 'dart:io';
import 'package:glob/glob.dart';
import 'package:meta/meta.dart';

Future<MasonBundle> generateTemplate(String root) async {
  final list = <FileTemplate>[];

  final file = Glob('{**.dart,**.yaml,**.graphql,**.md,LICENSE,.gitignore}');

  for (var entity in file.listSync(root: root)) {
    final filename = entity.path.replaceAll(root, '');
    final fileTemplate = await _fileToBase64(filename);
    list.add(fileTemplate);
  }

  return MasonBundle.fromJson(
    {
      'files': [
        for (var i = 0; i < list.length; i++)
          {'path': list[i].path, 'data': list[i].data, 'type': list[i].type}
      ]
    },
  );
}

Future<FileTemplate> _fileToBase64(String filename) async {
  final contents =
      await File('lib/src/template/files/$filename').readAsString();

  final fileBase64 = base64.encode(utf8.encode(contents));

  return FileTemplate(
    data: fileBase64,
    path: filename,
    type: 'text',
  );
}

class FileTemplate {
  final String path;
  final String data;
  final String type;

  FileTemplate({
    @required this.path,
    @required this.data,
    @required this.type,
  });
}
