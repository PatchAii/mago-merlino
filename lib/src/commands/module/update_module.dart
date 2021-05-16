import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:io/io.dart';
import 'package:mago_merlino/src/template/template.dart';
import 'package:mason/mason.dart';
import 'package:meta/meta.dart';

class UpdateModule extends Command<int> {
  UpdateModule({
    Logger logger,
  }) : _logger = logger ?? Logger();

  final Logger _logger;

  @override
  String get description =>
      'Updates the template of the flutter module project';

  @override
  String get summary => '$invocation\n$description';

  @override
  String get name => 'update-module';

  @override
  String get invocation => 'mago_merlino update-module';

  @visibleForTesting
  ArgResults argResultOverrides;

  @override
  Future<int> run() async {
    _logger
      ..flush(_logger.success)
      ..alert('Hockety pockety, wockety wack\nAbra, cabra, dabra, da')
      ..info('\n');

    final generateDone = _logger.progress('Updating module template');
    await generateTemplate(
      'lib/src/template/files/module/',
      'flutterModuleBundle',
    );

    generateDone('Updating module template complete');

    _logger
      ..info('\n')
      ..flush(_logger.success)
      ..alert('Higitus figitus, figitus sbum\nPresti-digi-torium');

    return ExitCode.success.code;
  }
}
