import 'package:intl/intl.dart';

String helloMessage(String msg) => Intl.message(
      "hello $msg",
      name: "helloMessage",
      args: [msg],
      desc: "向某人打招呼");

String counterMessage(int theNum) =>
    Intl.plural(
      theNum,
      zero: '零',
      one: '壹',
      other: '其他',
      name: "counterMessage",
      args: [theNum],
      desc: "中文的 0 1",
      examples: const {'howMany': 0});      

 String getGenderMessage(String gender) =>
    Intl.gender(
      gender,
      male: '男.',
      female: '女',
      other: '保密',
      name: "getGenderMessage",
      args: [gender],
      desc: "获取性别",
      examples: const {'gender': 'male'} );