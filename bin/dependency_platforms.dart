import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:dependency_platforms/dependency_platforms.dart';

void main(List<String> args) async {
  var runner = CommandRunner(
      'dependency_platforms', "List platforms of all dependencies");

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

  ArgResults results = parser.parse(args);
  if (results.arguments.contains('--help') ||
      results.arguments.contains('-h')) {
    print(parser.usage);
    return;
  }

  List<String> includes = results.option('include')?.split(',') ?? [];
  List<String> excludes = results.option('exclude')?.split(',') ?? [];

  if (includes.isNotEmpty && excludes.isNotEmpty) {
    print("Either use --include or --exclude, not both");
    return;
  }
  run(includes, excludes);
}
