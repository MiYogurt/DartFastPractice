import 'dart:io';

import 'package:analyzer/analyzer.dart';
import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';


main(List<String> args) {
  // "sss".split("").map((v) => v.codeUnitAt(0));
  "sss".codeUnits;

  var path = Platform.script.path.replaceAll("main.dart", "a.dart");
  List<String> includedPaths = <String>[path];
  AnalysisContextCollection collection =
      new AnalysisContextCollection(includedPaths: includedPaths);
  analyzeSomeFiles(collection, includedPaths);
}

analyzeSomeFiles(
    AnalysisContextCollection collection, List<String> includedPaths) {
  for (String path in includedPaths) {
    AnalysisContext context = collection.contextFor(path);
    analyzeSingleFile(context, path);
  }
}
analyzeSingleFile(AnalysisContext context, String path) async {
  AnalysisSession session = context.currentSession;
  ParsedUnitResult result = session.getParsedUnit(path);
  CompilationUnit unit = result.unit;
  print(unit);

  unit.declarations.forEach((d){
    print(d.runtimeType);
  });

  ResolvedUnitResult result2 = await session.getResolvedUnit(path);
  CompilationUnit unit2 = result2.unit;
  print(unit2);
  var visitor = ForCounter();
  unit2.visitChildren(visitor);
  print(visitor.count);
  // unit2.declarations.forEach((d){
  //   print(d.runtimeType); // FunctionDeclarationImpl
  //   if(d is FunctionDeclaration) {
  //     var visitor = ForCounter();
  //     d.visitChildren(visitor);
  //     print(visitor.count);
  //   }
  // });
  SimpleAstVisitor;
  GeneralizingAstVisitor;
  UnitElementResult el3 = await session.getUnitElement(path);
  CompilationUnitElement unit3 = el3.element;
  print(unit3);
  unit3.library.topLevelElements.forEach((fnEl){
    print(fnEl);
    if(fnEl is FunctionElement) {
      print(fnEl.kind);
    }
  });
  unit3.visitChildren(ParameterCounter());
  // unit3.declarations.forEach((d){
  //   print(d.runtimeType);
  //   if(d is FunctionDeclaration) {
  //     var visitor = ForCounter();
  //     d.visitChildren(visitor);
  //     print(visitor.count);
  //   }
  // });
}

class ParameterCounter extends GeneralizingElementVisitor<void> {
  @override
  void visitExecutableElement(ExecutableElement element) {
    print(element);
    super.visitExecutableElement(element);
  }
}

class ForCounter extends RecursiveAstVisitor {
  int count = 0;

  @override
  visitForStatement(ForStatement node) {
    count ++;
    print(node.toString());
    return super.visitForStatement(node);
  }

}