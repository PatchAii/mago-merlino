import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:io/ansi.dart';
import 'package:io/io.dart';
import 'package:mago_merlino/src/template/bundle/flutterFeatureTestBundle.dart';
import 'package:mason/mason.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;

final RegExp _identifierRegExp = RegExp('[a-z_][a-z0-9_]*');
typedef GeneratorBuilder = Future<MasonGenerator> Function(MasonBundle);

class CreateFeatureTest extends Command<int> {
  CreateFeatureTest({
    Logger? logger,
    GeneratorBuilder? generator,
  })  : _logger = logger ?? Logger(),
        _generator = generator ?? MasonGenerator.fromBundle {
    argParser.addOption(
      'project-name',
      help: 'The project name for this new Flutter feature test. '
          'This must be a valid dart package name.',
    );
    argParser.addFlag(
      'path',
      abbr: 'p',
      help: 'The path directory name for this new Flutter feature test. ',
    );
  }

  final Logger _logger;
  final Future<MasonGenerator> Function(MasonBundle) _generator;

  @override
  String get description =>
      'Creates a new flutter feature test project in the specified directory.';

  @override
  String get summary => '$invocation\n$description';

  @override
  String get name => 'create-feature-test';

  @override
  String get invocation =>
      'mago_merlino create-feature-test <output directory>';

  @visibleForTesting
  ArgResults? argResultOverrides;

  ArgResults? get _argResults => argResultOverrides ?? argResults;

  @override
  Future<int> run() async {
    _logger
      ..flush(_logger.success)
      ..alert('✨✨✨ Hockety pockety, wockety wack\nAbra, cabra, dabra, da ✨✨✨')
      ..info('\n')
      ..alert('🎶 https://www.youtube.com/watch?v=Tb75RjpvBIk 🎶')
      ..info('\n');

    final outputDirectory = _outputDirectory;
    final projectName = _projectName;
    final void Function([String]) generateDone =
        _logger.progress('Bootstrapping');
    final generator = await _generator(flutterFeatureTestBundle);
    final fileCount = await generator.generate(
      DirectoryGeneratorTarget(outputDirectory, _logger),
      vars: {
        'project_name': projectName,
        'project_name_capitalize':
            '${projectName[0].toUpperCase()}${projectName.substring(1)}'
      },
    );

    generateDone('Bootstrapping complete');
    _logSummary(fileCount);

    _logger
      ..info('\n')
      ..flush(_logger.success)
      ..alert('✨✨✨ Higitus figitus, figitus sbum\nPresti-digi-torium ✨✨✨');

    return ExitCode.success.code;
  }

  void _logSummary(int fileCount) {
    _logger
      ..info(
        '${lightGreen.wrap('✓')} '
        'Generated $fileCount file(s):',
      )
      ..flush(_logger.success)
      ..info('\n');
  }

  String get _projectName {
    final projectName = _argResults!['project-name'] ??
        path.basename(path.normalize(_outputDirectory.absolute.path));
    _validateProjectName(projectName);
    return projectName;
  }

  void _validateProjectName(String name) {
    final isValidProjectName = _isValidPackageName(name);
    if (!isValidProjectName) {
      throw UsageException(
        '"$name" is not a valid package name.\n\n'
        'See https://dart.dev/tools/pub/pubspec#name for more information.',
        usage,
      );
    }
  }

  bool _isValidPackageName(String name) {
    final match = _identifierRegExp.matchAsPrefix(name);
    return match != null && match.end == name.length;
  }

  Directory get _outputDirectory {
    final rest = _argResults!.rest;
    _validateOutputDirectoryArg(rest);
    return Directory(rest.first);
  }

  void _validateOutputDirectoryArg(List<String> args) {
    if (args.isEmpty) {
      throw UsageException(
        'No option specified for the output directory.',
        usage,
      );
    }

    if (args.length > 1) {
      throw UsageException('Multiple output directories specified.', usage);
    }
  }
}
