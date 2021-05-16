import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:io/io.dart';
import 'package:mago_merlino/src/commands/commands.dart';
import 'package:mason/mason.dart';

import '../version/version.dart';

class Runner extends CommandRunner<int> {
  Runner({Logger logger})
      : _logger = logger ?? Logger(),
        super('mago_merlino',
            'Hockety pockety, wockety wack\nAbra, cabra, dabra, da') {
    argParser.addFlag(
      'version',
      negatable: false,
      help: 'Print the current version.',
    );
    addCommand(CreateModule(logger: logger));
    addCommand(UpdateModule(logger: logger));

    addCommand(CreateFeature(logger: logger));
    addCommand(UpdateFeature(logger: logger));
  }

  static const timeout = Duration(milliseconds: 500);

  final Logger _logger;

  @override
  Future<int> run(Iterable<String> args) async {
    try {
      final _argResults = parse(args);
      return await runCommand(_argResults) ?? ExitCode.success.code;
    } on FormatException catch (e, stackTrace) {
      _logger
        ..err(e.message)
        ..err('$stackTrace')
        ..info('')
        ..info(usage);
      return ExitCode.usage.code;
    } on UsageException catch (e) {
      _logger
        ..err(e.message)
        ..info('')
        ..info(usage);
      return ExitCode.usage.code;
    }
  }

  @override
  Future<int> runCommand(ArgResults topLevelResults) async {
    if (topLevelResults['version'] == true) {
      _logger.info('mago_merlino version: $packageVersion');
      return ExitCode.success.code;
    }
    return super.runCommand(topLevelResults);
  }
}
