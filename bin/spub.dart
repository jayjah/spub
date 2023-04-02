// ignore_for_file: curly_braces_in_flow_control_structures, avoid_print

import 'dart:io' show exit;

import 'package:args/args.dart';
import 'package:dcli/dcli.dart' show red, green;
import 'package:pub_api_client/pub_api_client.dart' show PubClient;
import 'package:spub/spub.dart' as spub;

Future<void> main(List<String> arguments) async {
  final ArgResults parser = ArgParser().parse(arguments);
  final PubClient client = PubClient();
  final Iterable<spub.PubPackage> allPackages =
      parser.rest.map((String argument) => spub.PubPackage(
            argument,
            client: client,
          ));

  for (final spub.PubPackage package in allPackages) {
    final String packageName = package.name;
    if (!await package.exist()) {
      print(red(
        'Package: $packageName does not exist. Looking for a another one?\n Found following packages: ${await package.searchForSimilarPackages()}',
      ));
      continue;
    }

    print(green('Opening package: $packageName'));
    package
      ..openPackage()
      ..dispose();
  }

  exit(0);
}
