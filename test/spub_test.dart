import 'package:spub/spub.dart' as spub;
import 'package:test/test.dart';

void main() {
  const String packageName = 'args';

  test('parse', () {
    const spub.PubPackage parser = spub.PubPackage(packageName);

    expect(parser.pubPathAsUri.path.contains(packageName), true);
  });
}
