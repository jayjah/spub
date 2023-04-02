// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:spub/spub.dart' as spub;

void main(List<String> arguments) {
  //final parser = ArgParser().parse(arguments);

  for (final spub.PubPath searchFor in /*parser.rest*/ arguments
      .map(spub.PubPath.new)) searchFor.search().lines.map(print);
}
