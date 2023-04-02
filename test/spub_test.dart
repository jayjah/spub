import 'package:spub/spub.dart' as spub;
import 'package:test/test.dart';

void main() {
  const String packageName = 'args';

  test('parse', () {
    const spub.PubPackage package = spub.PubPackage(packageName);

    expect(package.pubPathAsUri.path.contains(packageName), isTrue);
    expect(package.name, same(packageName));
  });

  test('package exist', () async {
    const spub.PubPackage package = spub.PubPackage(packageName);

    expect(await package.exist(), isTrue);
  });

  test('package does not exist', () async {
    const spub.PubPackage package = spub.PubPackage('didldudlxxX');

    expect(await package.exist(), isFalse);
  });

  test('check for similar packages', () async {
    const spub.PubPackage package = spub.PubPackage('didldudlxxX');

    expect(await package.searchForSimilarPackages(), isList);
  });
}
