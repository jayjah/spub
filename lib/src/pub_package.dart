// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:io' show Platform;

import 'package:dcli/dcli.dart';
import 'package:meta/meta.dart' show visibleForTesting;
import 'package:pub_api_client/pub_api_client.dart';

class PubPackage {
  PubPackage(this._packageName, {PubClient? client})
      : _pubClient = client ?? PubClient();
  final String _packageName;
  final PubClient _pubClient;

  static const String _pubPath = 'https://www.pub.dev/packages/';

  String get name => _packageName;

  @visibleForTesting
  Uri get pubPathAsUri => Uri.parse('$_pubPath$_packageName');

  Future<bool> exist() async {
    try {
      await _pubClient.packageInfo(_packageName);

      return true;
    } on Exception {
      return false;
    }
  }

  Future<List<String>> searchForSimilarPackages() async {
    try {
      final SearchResults searchResult = await _pubClient.search(_packageName);

      return searchResult.packages
          .map((PackageResult e) => e.package)
          .toList(growable: false);
    } on Exception {
      return const <String>[];
    }
  }

  Progress open() {
    late final String osBrowser;
    if (Platform.isMacOS)
      osBrowser = 'open';
    else if (Platform.isLinux)
      osBrowser = 'xdg-open';
    else if (Platform.isWindows)
      osBrowser = 'start';
    else
      throw UnsupportedError(
        'Current platform ${Platform.operatingSystem} is not supported!',
      );

    return '$osBrowser ${pubPathAsUri.toString()}'.start(runInShell: true);
  }

  void dispose() {
    _pubClient.close();
  }
}
