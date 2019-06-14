import 'dart:html';
import 'dart:js';
import 'dart:js_util';
import 'ployfill.dart';
import 'sizeele.dart';


void main() {
  // var js_array = new JsArray();
  // js_array.length = 20;
  // js_array.fillRange(0, 20, 1);
  // window.console.log(js_array);
  // js_array[2] = 20;
  // js_array.forEach(print);

  // HtmlDocument doc = context['document'];
  // JsObject ret = context.callMethod('getComputedStyle', [doc.body]);
  // window.console.log(ret);

  // var obj = new JsObject(context['Object']); 
  // // 相当于 var obj = new Object()
  // window.console.log(obj);
  // obj['name'] = "yugo";
  // obj['sayHello'] = () => obj['name'];
  // print(obj.callMethod('sayHello'));
  // print(obj['sayHello']());

  // print(obj.hasProperty('name'));
  // obj.deleteProperty('name');
  // print(obj.hasProperty('name'));

  // var func = JsFunction.withThis(sayHello);
  // window.console.log(func.apply([1,2,3], thisArg: JsObject(context['Object'])));
  // func['work'] = () => print('work');
  // func.callMethod('work');

  // var a = newObject();  // {}
  // window.console.log(a); 
  // setProperty(a, 'name', 'yugo');
  // var name = getProperty(a, 'name');
  // print(name);

  // // a['say'] = () => print("hello"); // error
  // setProperty(a, 'say', () => print("hello"));

  // callMethod(a, 'say', []);

  // print(instanceof(a, JSObject));
  // var dart_list = List.generate(3, (i) => i * 2);
  // var alist = jsify(dart_list);
  // window.console.log(alist); // [0, 2, 4]

  // var dart_map = Map.fromIterables(dart_list, dart_list);
  // var amap = jsify(dart_map);
  // window.console.log(amap); // {0: 0, 2: 2, 4: 4}

  // var raw_obj = callConstructor(JSObject, []);
  // window.console.log(raw_obj);

  print(add(1,2));

  var p = new pets();
  p.dogs.forEach(print);
  p.dogs.add("dog3");
  p.printDogs();

  var u1 = new User(username: "hello", password: "world");
  print(u1.toStr());

  var u2 = new UserTwo(UserTwoOptions(username: "a", password: "b"));
  print(u2.toStr());

  fetchFriend().then(print);

  var body = Sizzle("body");
  print(body);
}

JsObject sayHello(JsObject self, a, b, c){
  window.console.log([a, b, c]); // [1, 2, 3]
  self['name'] = "yugo";
  return self;
}
