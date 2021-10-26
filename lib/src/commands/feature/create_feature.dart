import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:io/ansi.dart';
import 'package:io/io.dart';
import 'package:mago_merlino/src/template/bundle/flutterFeatureBundle.dart';
import 'package:mason/mason.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;

import '../commands.dart';

final RegExp _identifierRegExp = RegExp('[a-z_][a-z0-9_]*');

class CreateFeature extends Command<int> {
  CreateFeature({
    Logger? logger,
    GeneratorBuilder? generator,
  })  : _logger = logger ?? Logger(),
        _generator = generator ?? MasonGenerator.fromBundle {
    argParser.addOption(
      'feature-name',
      help: 'The project name for this new Flutter feature. '
          'This must be a valid dart package name.',
    );
    argParser.addFlag(
      'path',
      abbr: 'p',
      help: 'The path directory name for this new Flutter feature. ',
    );
  }

  final Logger _logger;
  final Future<MasonGenerator> Function(MasonBundle) _generator;

  @override
  String get description =>
      'Creates a new flutter feature project in the specified directory.';

  @override
  String get summary => '$invocation\n$description';

  @override
  String get name => 'create-feature';

  @override
  String get invocation => 'mago_merlino create-feature <output directory>';

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
    final featureName = _featureName;
    final void Function([String]) generateDone =
        _logger.progress('Bootstrapping');
    final generator = await _generator(flutterFeatureBundle);
    final fileCount = await generator.generate(
      DirectoryGeneratorTarget(outputDirectory, _logger),
      vars: {
        'feature_name': featureName,
        'feature_name_capitalize':
            '${featureName[0].toUpperCase()}${featureName.substring(1)}'
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

  String get _featureName {
    final featureName = _argResults!['feature-name'] ??
        path.basename(path.normalize(_outputDirectory.absolute.path));
    _validateFeatureName(featureName);
    return featureName;
  }

  void _validateFeatureName(String name) {
    final isValidFeatureName = _isValidPackageName(name);
    if (!isValidFeatureName) {
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
