import 'dart:mirrors';

class Todo{
  final String name;
  const Todo(this.name);
}

@Todo("good")
class A<T,F> {
  A([String name]);
  void sayHello() => print("hello");
}

var a = A<num, String>();

typedef void Some(String name);

main(List<String> args) {
  var sys = currentMirrorSystem();
  sys.libraries.forEach((k, v){
    // print(k);
    // print(v);
  });
  var main = sys.findLibrary(Symbol("")); // main 

  // main.libraryDependencies.forEach((v) {
  //   print(v.isExport); // false
  //   print(v.isImport); // true
  //   v.loadLibrary().then(print); // LibraryMirror on 'dart.mirrors'
  // });

  // print(main.location); // package:mirors_test/main.dart:1:1
  // print(main.qualifiedName); // ""

  main.declarations.forEach((k, v) {
    print(v);
    if (k == #a) {
      var refa = main.getField(k);
      refa.invoke(#sayHello, []);
    }

    if (k == #A && v is ClassMirror) {
      v.metadata.forEach((v) {
        print("todo 装饰器的值为 " + v.getField(#name).reflectee);
      });
      v.typeVariables.forEach(print); // 泛型参数
      v.staticMembers;
      v.superclass;
      v.superinterfaces;
      v.mixin;
      v.instanceMembers; 
      var newStance = v.newInstance(Symbol(""), ["none"]);
      newStance.invoke(#sayHello, []); // hello
      newStance.type.typeArguments.forEach(print); // dynamic，dynamic

      newStance.delegate(Invocation.method(#sayHello, [])); // hello
    }

    if (k ==#main && v is MethodMirror) {
      // print(v.source); // 源码
      v.parameters.forEach((v){
        print(v.type); // ClassMirror on 'List'
        print(v.simpleName); // Symbol("args")
      }); 
      v.metadata.forEach(print); // 无输出，因为没有设置装饰器
    }
  });

  var refa = reflect(a);
  refa.invoke(#sayHello, []);
  refa.type.typeArguments.forEach(print); // num，String
  refa.reflectee;

  var classA = reflectClass(A);

  var typea = reflectType(A);
  typea.typeArguments.forEach(print); // dynamic, dynamic
}

