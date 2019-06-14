import 'dart:io';

main(List<String> args) {
  var str = String.fromCharCodes([13,10,67,111,110,116,101,110,116,45,68,105,115,112,111,115,105,116,105,111,110,58,32,102,111,114,109,45,100,97,116,97,59,32,110,97,109,101,61,34,99,34,13,10,13,10,49,51,51,51,51,57,120,97,115,100,13,10]);
  var i = 0;
  for (var m in RegExp(r"\n(.+)", multiLine: true).allMatches(str)){
    print(i);
    i++;
    print(m.group(1));
  }
}