import 'dart:io';

main(List<String> args) {
  print(args);
  stdout.writeln("hello world");
  stdout.add([97,98,99,100, "\n".codeUnitAt(0 )]);
  var strList = "list: hello".split('').map((v) => v.codeUnitAt(0)).toList();
  var sm = Stream.fromIterable([strList]);
  stdout.addStream(sm);
  stderr.writeln("err: hello world");

  var str = stdin.readLineSync();
  print(str);

  var a = stdin.asBroadcastStream();
  a.listen(print);

}