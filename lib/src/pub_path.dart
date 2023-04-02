// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:meta/meta.dart';

class PubPath {
  const PubPath(this._packageName);
  final String _packageName;

  static const String _pubPath = 'https://www.pub.dev/packages/';

  @visibleForTesting
  Uri get pubPathAsUri {
    return Uri.parse('$_pubPath$_packageName');
  }

  Progress search() {
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
}
