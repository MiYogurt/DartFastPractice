import 'package:analyzer/analyzer.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/src/generated/testing/token_factory.dart';
import 'package:analyzer/src/dart/ast/token.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:analyzer/dart/ast/standard_ast_factory.dart';

String src = """
main(){
  var o = "sss".split("").map((v) => v.codeUnitAt(0));
}
""";
main(){
  var ast = parseCompilationUnit(src, parseFunctionBodies: true);
  print(ast.toSource());
  // ast.childEntities.forEach((v){
  //   // print(v.runtimeType); // FunctionDeclarationImpl
  //   if(v is FunctionDeclaration){
  //     v.childEntities.forEach((v){
  //       // print(v.toString()); // 
  //       // print("runtype " + v.runtimeType.toString()); 
  //       if (v is FunctionExpression) {
  //         v.body.childEntities.forEach((v){
  //           if(v is Block){
  //             v.childEntities.forEach((v){
  //               if (v is VariableDeclarationStatement) {
  //                 v.variables.childEntities.forEach((v){
  //                   if (v is VariableDeclaration) {
  //                     print(v.toSource()); // o = "sss".split("").map((v) => v.codeUnitAt(0))
  //                     print(v.initializer);
  //                   } 
  //                 });
  //               }
  //             });
  //           }
  //         });
  //       }

  //       if (v is SimpleIdentifier) {
  //         // main
  //       }

  //     });
  //   }

  // });
  var v = new Visitor();
  ast.visitChildren(v);
  print(ast.toSource());
}
class Visitor extends RecursiveAstVisitor{
  @override
  visitVariableDeclaration(VariableDeclaration node){
    //filter
    var p = RegExp(r'\.split\(""\)\.map\(\(v\) => v.codeUnitAt\(0\)\)');
    if(!p.hasMatch(node.toString())) return;

    //replace
    VariableDeclaration ssl = newSimpleString(node);
    node.parent.accept(NodeReplacer(node,ssl));
  }
}

VariableDeclaration newSimpleString(VariableDeclaration node){
  String new_string = optimize(node.toString());
  // print(node.initializer.runtimeType); // MethodInvocationImpl
  int line_num = node.offset;
  StringToken st = new StringToken(
      TokenType.STRING, new_string,line_num);
  var express = astFactory.simpleIdentifier(st);
  return astFactory.variableDeclaration(node.name, TokenFactory.tokenFromType(TokenType.EQ), express);
}
String optimize(String s){
  var val = s.split(".")[0].split("=")[1];
  return "$val.codeUnits";
}