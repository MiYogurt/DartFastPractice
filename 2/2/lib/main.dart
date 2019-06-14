import 'package:path/path.dart' as Path;
import 'dart:io';
import './o.dart';

main(List<String> args) {
  var url = Uri.parse("http://www.baidu.com/a/b/c?d=3#e=2");
  print(url.scheme); // http
  print(url.host); // www.baidu.com
  print(url.path); // /a/b/c
  print(url.fragment); // e=2
  print(url.origin); // http://www.baidu.com
  print(url.query); // d=3
  Path.fromUri(Uri());

  var path = Path.fromUri("file:///Users/yugo");
  print(Path.toUri("/Users/yugo"));
  print(path); // /Users/yugo

  //   * absolute --> current path
  // * relative --> current path
  // * join
  // * joinAll
  // * dirname
  // * basename
  // * normalize

  print(Path.current);
  print(Directory.current);
  print(Path.absolute("./a.dart"));
  print(Path.relative("./a.dart"));
  print(Path.join(Path.current,"./a.dart"));
  print(Path.joinAll([Path.current,"./a.dart"]));
  print(Path.dirname("/a/b/c"));
  print(Path.basename("./a.dart"));
  print(Path.normalize("./a.dart"));
  print('1: ' + Platform.script.toString());
  print('2: ' + Platform.script.path);
  print('3: ' + Platform.executable);
  print('5: ' + Platform.resolvedExecutable);

  init();
}