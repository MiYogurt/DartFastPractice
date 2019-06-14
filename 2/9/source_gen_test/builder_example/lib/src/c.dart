import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';
import 'util.dart';

class PropertyProductGenerator extends Generator {
  @override
  String generate(LibraryReader library, BuildStep buildStep) {
    final productNames = topLevelNumVariables(library)
        .map((element) => element.name)
        .join(' * ');

    return '''
num allProduct() => $productNames;
''';
  }
}