// class CtorSample {
//   String name;
//   CtorSample(String name){
//     this.name = name;
//   }
//   CtorSample.named(){

//   }
// }
class CtorSample {
  String name;
  CtorSample(String _name): name=_name {

  }
}


class AConst {
  final String name;
  const AConst(this.name);
}

// class CtorSample {
//   String name;
//   CtorSample(this.name){}
// }


class Member {
  static const String aConst =  "123";
  final String aFinal;
  Member(this.aFinal);
}

class FactoryCls {
  static FactoryCls singletons;
  FactoryCls._();
  String name = "123";
  factory FactoryCls.onlyOne(){
    if(singletons != null) return singletons;
    singletons = FactoryCls._();
    return singletons;
  }
}

class MemberFunc {
  void sayHello(String name, [String other]){}
  void sayHelloFor({String name = "bobo"}) {}
}

class Test {
  String _name;

  get name => _name;

  set name(value) {
    if (value.contains("yugo")) {
      throw "error";
    }
    this._name = name;
  }
}

class A extends Base {
  A(): super();
  @override
  void todo() {
  }
}

class B implements Base{
  void todo() {}
  saySome(){}
}

abstract class Base {
  Base();
  void saySome(){
    print("hello");
  }
  void todo();
  factory Base.named(){
    return A();
  }
}

class C1 {
  void hello(){
    print("hello");
  }
}

class C2 extends C1 {}

class No {
  void noSuchMethod(Invocation invocation) {
    invocation.namedArguments.forEach((k,v) => print("$k $v")); // Symbol("name") hello
    invocation.positionalArguments.forEach(print); // 1 2
    invocation.typeArguments.forEach(print); // num
    print(invocation.memberName); // Symbl("todo")
  }

  call(){
    print("hello");
  }
}


class A1<T extends Base> {
  T name;
  T getName(){return name;}
  R getR<R>(){}
}


T getSome<T>(){

}

var getC = <T>(T name) => name;


main(List<String> args) {

  dynamic no = No();

  getC<String>("hello");

  // no.todo<num>(1,2, name: "hello");
  no();
  var c2 = C2();
  c2.hello();

  // FactoryCls a = FactoryCls.onlyOne();
  // print(a.name); // 123
  // a.name = "new";
  // print(FactoryCls.onlyOne().name); // new
  // print(a.name); // new

  var a = Test();
  a.name = "some";
  a.name;
}