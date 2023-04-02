// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:io' show exit;

import 'package:args/args.dart';
import 'package:dcli/dcli.dart' show red, green;
import 'package:spub/spub.dart' as spub;

Future<void> main(List<String> arguments) async {
  final ArgResults parser = ArgParser().parse(arguments);

  for (final spub.PubPackage package in parser.rest.map(spub.PubPackage.new)) {
    if (!await package.exist()) {
      print(red(
        'Package: ${package.name} does not exist. Looking for a another one?\n Found following packages: ${await package.searchForSimilarPackages()}',
      ));
      continue;
    }

    print(green('Opening package: ${package.name}'));
    package.search();
  }

  exit(0);
}
