main(List<String> args) {
  num n1 = null;
  n1 ??= 2;
  print(n1);


  var arr = [1,2,3]
    ..add(4)
    ..add(5)
    ..add(6);
  print(arr);

  dynamic n2 = 20;
  if (n2 is num) {
    print("n2 is num");
  }

  if(n2 is! String) {
    print("n2 not String");
  }

  num n3 = null;

  // print(n3.toString()); // 报错
  print(n3?.toString()); // null

  var n4 = (n3 as String);
  n4 = "something";
  print(n3); // null
  print(n4); // something

  var rule = Rule((x) => true) >= Rule((x) => true);

  rule.checker(10);
}

class Rule {
  Function checker;
  Rule(this.checker);
  Rule operator >= (Rule r2) {
    return Rule((value){
      if (this.checker(value)) {
        return r2.checker(value);
      }
      return false;
    });
  }
}