import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';


Iterable<TopLevelVariableElement> topLevelNumVariables(LibraryReader reader) =>
    reader.allElements.whereType<TopLevelVariableElement>().where((element) =>
        element.type
            .isAssignableTo(reader.element.context.typeProvider.numType));
