import 'dart:convert';
import 'dart:io';

import 'package:console_bars/console_bars.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:dolumns/dolumns.dart';

void run(List<String> includes, List<String> excludes) async {
  File pubspecFile = File('pubspec.yaml');
  if (!pubspecFile.existsSync()) {
    print('pubspec.yaml not found');
    return;
  }

  Pubspec pubspec = Pubspec.parse(pubspecFile.readAsStringSync());
  Map<String, Dependency> dependencies = pubspec.dependencies;
  List<String> packages =
      dependencies.keys.where((e) => e != 'flutter').toList();
  print("Found ${packages.length} packages");

  List<List<String>> packagesData = [];
  final progressBar = FillingBar(
    desc: "Loading",
    total: packages.length,
    time: true,
    percentage: true,
  );

  File cacheFile = File('dependency_cache.json');
  if (!cacheFile.existsSync()) {
    cacheFile.createSync(recursive: true);
  }
  String cache = cacheFile.readAsStringSync();
  Map<String, dynamic> cacheData = {};
  if (cache.isNotEmpty) {
    cacheData = Map.from(json.decode(cache));
  }
  Map<String, List<String>> newCache = {};
  for (String package in packages) {
    List<String> cachedPlatforms = List<String>.from(cacheData[package] ?? []);
    List<String> platforms = cachedPlatforms.isNotEmpty
        ? cachedPlatforms
        : await getPlatforms(package);
    List<String> expectedPlatforms = [
      "android",
      "ios",
      "linux",
      "macos",
      "web",
      "windows"
    ];

    List<String> validPlatforms = [];

    for (String expectedPlatform in expectedPlatforms) {
      if (platforms.any((e) => e.toLowerCase() == expectedPlatform)) {
        validPlatforms.add(expectedPlatform);
      } else {
        validPlatforms.add('-');
      }
    }
    progressBar.increment();
    newCache[package] = validPlatforms;

    if (includes.isNotEmpty) {
      if (!includes.every((e) => validPlatforms.contains(e))) {
        continue;
      }
    }
    if (excludes.isNotEmpty) {
      if (excludes.any((e) => validPlatforms.contains(e))) {
        continue;
      }
    }
    packagesData.add([package, ...validPlatforms]);
  }
  // Save cache
  await cacheFile.writeAsString(json.encode(newCache));

  await Future.delayed(const Duration(milliseconds: 500));
  print("Results: \n");
  final columns = dolumnify(packagesData);
  print(columns);
}

Future<List<String>> getPlatforms(String package) async {
  try {
    Response response =
        await get(Uri.parse('https://pub.dev/packages/$package'));
    var document = parse(response.body);
    var platforms = document.getElementsByClassName("tag-badge-sub");
    List<String> platformsList = [];
    for (var platforms in platforms) {
      String platform = platforms.innerHtml;
      // Ignore Sdk
      if (platform == "Dart" || platform == "Flutter") continue;
      platformsList.add(platform);
    }
    return platformsList;
  } catch (e) {
    return [];
  }
}