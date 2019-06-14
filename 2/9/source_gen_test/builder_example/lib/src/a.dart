import 'package:source_gen/source_gen.dart';
import './util.dart';

class MyGenerator extends Generator {
  String generate(lib, step) {
    return "var sum = " +
        topLevelNumVariables(lib).map((v) => v.name).length.toString() +
        ";";
  }
}