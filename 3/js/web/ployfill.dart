@JS()
library polyfill;

import 'package:js/js.dart';
import 'dart:async';

@JS('Object')
external get JSObject;

@JS('add')
external num add(num a, num b);

@JS('pets')
abstract class pets {
  external factory pets();
  List<String> dogs;
  void printDogs();
}

@JS('User')
abstract class User {
  String username;
  String password;
  external factory User({String username, String password});
  String toStr();
}

@JS()
@anonymous
abstract class UserTwoOptions {
  String get username;
  String get password;
  external factory UserTwoOptions({String username, String password});
}

@JS('User')
abstract class UserTwo {
  String username;
  String password;
  external factory UserTwo(UserTwoOptions options);
  String toStr();
}


@JS("fetchFriend")
external void _fetchFriend(void Function(List<String>) callback);

Future<List<String>> fetchFriend(){
  var ctrl = new Completer<List<String>>();

  _fetchFriend((a) => ctrl.complete(a.cast()));
  // _fetchFriend(allowInterop(ctrl.complete)); // 假如类型没有错误的话
  return ctrl.future;
}