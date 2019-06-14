typedef MyInt1 = int Function(String args);
typedef int MyInt2(String args);

main(List<String> args) {
  // var isNum = 20;
  // int isInt = 20;

  // const compileArray1 = [1,2,3];
  // const compileArray2 = const [1,2,3];
  // var compileArray3 = const [1,2,3];
  // num num_some = 20;
  // var a = int.parse('99', radix: 16);
  // print(a);
  // var ret = int.tryParse('xx'); // null
  // print(ret);
  // double d = -2.9;
  // print(d.round()); // -3
  // print(d.ceil()); // -2
  // print(d.floor()); // -3
  // print(d.abs()); // 2.9
  // print(d.truncate()); // -2 | ceil(abs())
  // print(d.clamp(29, 30));
  // print(d.compareTo(20)); // -1

  // String str = "basetype";
  // var str2 = 'basetype';
  // var str3 = """
  //   basetype
  // """;
  // var str4 = r"\n"; // 原始字符串
  // print(str4); // 输出 \n 而不是输出换行
  // // compare
  // print(str.compareTo("basetype"));
  // // Pattern
  // print("pattern");
  // for (var i in 'e'.allMatches('basetype hello')) {
  //   print(i.start); // 3 7 10
  //   print(i.group(0)); // e e e
  // }

  // var ret1 = 'e'.matchAsPrefix("e2e2d"); // 以 e 开头的
  // print(ret1.end);

  // print(str.codeUnitAt(0)); // 第一个字符编码值
  // print(str.codeUnits); // 字符编码值数组
  // print(str.runes); // 字符编码值可迭代对象
  // print(String.fromCharCodes([0x1D11E]));
  // print(String.fromCharCode(0x1D11E));
  // print(String.fromEnvironment("AA",
  //     defaultValue: "NO")); // dart -DAA=world basetype.dart
  // print("Coco".endsWith('o')); // true
  // print("Coco".startsWith('C')); // true
  // print("Coco".startsWith(new RegExp(r'C'))); // true
  // print("Coco".indexOf('C')); // 0
  // print("Coco".lastIndexOf('c')); // 2
  // print('i love dart'.substring(2, 6)); // love
  // print('i love dart'.contains('love')); // true
  // print('i love dart'.replaceFirst(RegExp(r"love"), "hate")); // i hate dart
  // print('abc abc'
  //     .replaceFirstMapped(RegExp(r"a"), (v) => v.start.toString())); // 0bc abc
  // print('abc abc'.replaceAll(RegExp(r"a"), "aa")); // aabc aabc
  // print('i hate dart'.replaceRange(2, 6, "love")); // i love dart
  // print('i hate dart'.split(" ")); // ['i','hate', 'dart]
  // print("abba".split(RegExp(r"b*"))); // ['a','a'];
  // print("ABC".toLowerCase()); // abc
  // print("abc".toUpperCase()); // ABC

  // print("i hate dart".splitMapJoin(RegExp(r"hate"),
  //     onMatch: (_) => "love", onNonMatch: (_) => "=="));
  // // ==love==

  // var templateStr1 = "$str hello";
  // var templateStr2 = "${str.runes.toString()} hello";

  // bool isTrue = true;

  // List<num> theList = [1, 2, 3];
  // // Iterable
  // print(List.generate(3, (i) => i)); // [0,1,2]

  // var filled = List.filled(3, []); // 同一个引用
  // filled[0].add(20);
  // print(filled);
  // filled[1] = [222];
  // print(filled);

  // print(List.from({a: "b"}.keys)); // ['a']  -> List<dynamic>

  // print(List.of([5, 5, 5],
  //     growable:
  //         true)); //  List<E>.from(elements, growable: growable);  List<int>
  // print(List(3)); // [null,null,null]
  // print(List.unmodifiable([1, 2, 3])); // 无法修改的数组
  // print(List.castFrom<num, int>([1, 2, 3]));

  // var aRange = List(5);
  // var bRange = List(5);

  // List.copyRange(aRange, 1, [2, 3, 4, 5]);
  // List.writeIterable(bRange, 1, [2, 3, 4, 5]);

  // print(aRange);
  // print(bRange);

  // print([1, 2].first); // 1
  // print([1, 2].last); // 2
  // var addList = [1, 2, 3];
  // addList.add(4);
  // addList.addAll([5, 6]);
  // print(addList); // [1,2,3,4,5,6]
  // var sortList = [3, 2, 1];
  // sortList.sort();
  // print(sortList); // [1,2,3]
  // var randomList = [1, 2, 3];
  // randomList.shuffle();
  // print(randomList); // 随机顺序

  // // List<String> notes = ['do', 're', 'mi', 're'];
  // // notes.indexOf('re'); // 1
  // // notes.indexOf('re', 2); // 3

  // // List<String> notes = ['do', 're', 'mi', 're'];
  // // notes.indexWhere((note) => note.startsWith('r')); // 1
  // // notes.indexWhere((note) => note.startsWith('r'), 2); // 3

  // List<String> notes = ['do', 're', 'mi', 're'];
  // notes.lastIndexWhere((note) => note.startsWith('r')); // 3
  // notes.lastIndexWhere((note) => note.startsWith('r'), 2); // 1

  // var insertArr = [1, 2, 3];
  // insertArr.insert(0, 20);
  // print(insertArr); // [20, 1, 2, 3]
  // insertArr.insertAll(4, [4, 5]);
  // print(insertArr); // [20, 1, 2, 3, 4, 5]

  // var setArr = [1, 2, 3];
  // setArr.setAll(1, [1, 2]);
  // print(setArr); // [1, 1, 2]
  // var setArr1 = [1, 2, 3];
  // setArr1.setRange(0, 1, [3, 4, 5]);
  // print(setArr1); // [3, 2, 3]

  // var removeArr1 = [1, 1, 2];
  // removeArr1.remove(1);
  // print(removeArr1); // [1, 2]
  // var removeArr2 = [1, 1, 2];
  // removeArr2.removeLast();
  // print(removeArr2); // [1, 1]
  // var removeArr3 = [1, 3, 2];
  // removeArr3.removeAt(1);
  // print(removeArr3); // [1, 2]
  // var removeArr4 = [1, 3, 2];
  // removeArr4.removeRange(0, 1);
  // print(removeArr4); // [3, 2]
  // var removeArr5 = [1, 3, 2];
  // removeArr5.removeWhere((i) => i == 3);
  // print(removeArr5); // [1, 2]

  // var retainArry = [1, 1, 3];
  // retainArry.retainWhere((v) => v == 1);
  // print(retainArry); // [1,1]

  // var subList = [1, 2, 3, 4, 5];
  // print(subList.sublist(2, 4)); // [3, 4]
  // print(subList.getRange(2, 4).toList()); // [3, 4]

  // var fillRangeArr = [1, 2, 0, 0, 0];
  // fillRangeArr.fillRange(2, 5, 5);
  // print(fillRangeArr); // [1, 2, 5, 5, 5]

  // var replaceRangeArr = [1, 2, 0, 0, 0];
  // replaceRangeArr.replaceRange(2, 5, [3,4,5]);
  // print(replaceRangeArr); // [1, 2, 3, 4, 5]

  // var mapList = ['a', 'b', 'c'];
  // print(mapList.asMap()); // {0: a, 1: b, 2: c}

  // Set set1 = Set();
  // // external bool identical(Object a, Object b);
  // var set2 = Set.identity();
  // var set3 = Set.from([1, 1, 1, 3]);

  // var set4 = Set.of([1, 1, 1, 3]);

  // Set.castFrom<num, int>([1,2,3].toSet());

  // print(Set.of([1, 1, 1, 3]).contains(1)); // true
  // print(Set.of([1, 1, 1, 3]).containsAll([1, 3])); // true

  // print(Set.of([1,2,3]));

  // var set5 = Set.of([1, 1, 1, 3]);
  // set5.add(4);
  // print(set5); // {1,3,4}
  // var set6 = Set.of([1, 1, 1, 3]);
  // set6.addAll([5,6]);
  // print(set6); // {1,3,5,6}

  // var set7 = Set.of([1, 1, 1, 3]);
  // set7.remove(3);
  // print(set7); // {1}

  // var set8 = Set.of([1, 4, 3]);
  // set8.removeAll([1,3]);
  // set8.removeWhere((v) => v == 1);
  // print(set8);// {4}
  
  // var set9 = Set.of([1, 1, 1, 3]);
  // print(set9.lookup(3)); // 3

  // var set10 = Set.of([1,2,3,4]);
  // set10.retainAll([1,3,5]);
  // print(set10); // {1,3} 因为原始集合 5 没有

  // var set11 = Set.of([1,2,3,4]);
  // set11.retainWhere((v) => v == 1);
  // print(set11);  // {1}

  // print([1,2].toSet().intersection([1,3].toSet())); // A B 都有的元素 {1}
  // print([1,2].toSet().union([1,3].toSet())); // A B 所有元素 {1,2,3}
  // print([1,2].toSet().difference([1,3].toSet())); // A 有 B 没有的元素 {2}

  // print([1, 2, 3].join(",")); // "1,2,3"
  // print([1,2,3].firstWhere((v) => v == 2)); // 2
  // print([1,2,3].last); // 3
  // print([1,2,3].first); //1
  // print([1,2,3].lastIndexWhere((v) => v == 3)); // 2
  // print([1,2,3].lastWhere((v) => v == 3)); // 3
  // print([1,2,3].map((v) => v + 1)); // (2, 3, 4)
  // print([1,2,3].reduce((acc, v) => acc +v)); //  6 第一个值作为初始值
  // print([1].single); // 1
  // print([1].singleWhere((v) => v == 1)); // 1 只找到一个
  // print([1,2,3].skip(1)); // (2,3)
  // print("skip while");
  // print([1,2,3].skipWhile((v) => v != 2)); // (2,3)
  // print([1,2,3].take(2)); // (1,2)
  // print("take while");
  // print([1,3,2].takeWhile((v) => v != 2)); // (1, 3)
  // print([1,3,4].where((v) => v > 2)); // (3,4)
  // print(["1", 1, "3"].whereType<num>()); // (1)
  // print([1,2,3].reversed); // (3,2,1)
  // print([1,2,3].any((v) => v > 2)); // true
  // print([1,2,3].every((v) => v > 0)); // true
  // print([1,2,3].elementAt(0)); // 1
  // print([1,2,3].fold<int>(0, (acc, val) => (acc+val))); // 6
  // [1,2,3].forEach(print); // 1 ， 2 ，3
  // var ret = [1,2,3].followedBy([9,1,5, 4,2]); // 懒合并
  // print(ret); // (1, 2, 3, 9, 1, 5, 4, 2)


  var map1 = new Map<String, num>();
  var map2 = {"1":1,"2":2,"3":3};
  var map3 = Map.unmodifiable({"hello": "world"});
  var map4 = Map.fromIterable([1,2,3], key: (i) => i.toString(), value: (i) => i);
  // {"1":1,"2":2,"3":3}
  var map5 = Map.fromIterables(["1","2","3"], [1,2,3]);
  // {"1":1,"2":2,"3":3}
  var map6 = Map.fromEntries([MapEntry("1", 1), MapEntry("2", 2)]); // {"1":1,"2":2}

  print({"1": 1}.containsKey("1"));
  print({"1": 1}.containsValue(1));

  var map7 = {"a":2};
  map7.update("a", (v) => v + 1);
  map7["a"] += 1;
  map7.updateAll((key, value){
    if (key == "a") {
      return value + 1;
    }
  });

  map7.remove("a");
  map7.removeWhere((key, vaue) => key == "a");
  map7.clear(); // 清空元素
  map7.putIfAbsent("b", () => 20);
  map7.addAll({"a": 2, "b": 3});
  map7.addEntries([MapEntry("1", 1), MapEntry("2", 2)]);
  ({"a":1, "b":2}).keys.toList(); // ["a", "b"]
  ({"a":1, "b":2}).values.toList();// [1,2]
  
  Runes("🍆 🍉 🍎").forEach((v) => print(v));
  Symbol;

  var key = Symbol("onlyOne");
  print(key == #onlyOne);
  print({#onlyOne: "hello"});

  print([1,2,3, ...[4,5]]);
  print([
    1,2,3,
    for (var i in [4,5]) i+1,
  ]);
  print([
    1,2,3,
    if(true) 4,
  ]);
}
