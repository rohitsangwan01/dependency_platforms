import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:dependency_platforms/dependency_platforms.dart';

/// Get all supported platforms of your project
void main(List<String> args) async {
  var runner = CommandRunner(
    'dependency_platforms',
    "List platforms of all dependencies",
  );

  var parser = runner.argParser;

  parser.addOption(
    "include",
    abbr: 'i',
    help: 'List dependencies only including these platforms',
  );
  parser.addOption(
    "exclude",
    abbr: 'e',
    help: 'List platforms that does not have these platforms',
  );
  parser.addFlag(
    'cache',
    abbr: 'c',
    help: 'Cache result and use next time',
    defaultsTo: true,
  );

  ArgResults results = parser.parse(args);
  if (results.arguments.contains('--help') ||
      results.arguments.contains('-h')) {
    print(parser.usage);
    return;
  }

  List<String> includes = results.option('include')?.split(',') ?? [];
  List<String> excludes = results.option('exclude')?.split(',') ?? [];

  bool cacheResult = results.flag('cache');

  if (includes.isNotEmpty && excludes.isNotEmpty) {
    print("Either use --include or --exclude, not both");
    return;
  }

  run(
    includes,
    excludes,
    cacheResult,
  );
}
