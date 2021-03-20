import 'dart:convert';
import 'dart:io';
import 'package:glob/glob.dart';
import 'package:meta/meta.dart';

Future<void> generateTemplate(String root) async {
  final list = <FileTemplate>[];

  final file =
      Glob('{**.dart,**.yaml,**.graphql,**.md,LICENSE,.gitignore,**.svg}');

  for (var entity in file.listSync(root: root)) {
    final filename = entity.path.replaceAll(root, '');
    final fileTemplate = await _fileToBase64(filename);
    list.add(fileTemplate);
  }

  final m = {
    'files': [
      for (var i = 0; i < list.length; i++)
        {'path': list[i].path, 'data': list[i].data, 'type': list[i].type}
    ]
  };

  await File('lib/src/template/templateBundle.dart').writeAsString(
    '''
// ignore_for_file: prefer_single_quotes
import \'package:mason/mason.dart\';

final templateBundle = MasonBundle.fromJson(${getPrettyJSONString(m)});
''',
    mode: FileMode.write,
  );
}

String getPrettyJSONString(jsonObject) {
  final encoder = const JsonEncoder.withIndent('    ');
  return encoder.convert(jsonObject);
}

Future<FileTemplate> _fileToBase64(String filename) async {
  final contents =
      await File('lib/src/template/files/$filename').readAsString();

  final fileBase64 = base64.encode(utf8.encode(contents));

  return FileTemplate(
    data: fileBase64,
    path: filename,
    type: filename.contains('svg') ? 'binary' : 'text',
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
