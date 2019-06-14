import 'package:quiver/time.dart';
import 'package:quiver/strings.dart';
import 'package:quiver/pattern.dart';
import 'package:quiver/iterables.dart';
import 'package:quiver/cache.dart';
import 'package:quiver/async.dart';


main() {
  print(aDay); // 一天
  print(aMicrosecond); // 微秒，百万分之一秒
  print(aMillisecond); // 毫秒，千分之一秒
  print(aMinute); // 一分钟
  print(anHour); // 一小时
  print(aSecond); // 一秒
  print(aWeek); // 一周

  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // var token = prefs.getString("user_token");

  print(loop("hello", 0, -2)); // ol

  var g = Glob("/User/yugo/**/*.md");
  print(g.hasMatch("/User/yugo/a/some.md"));

  range(0, 10, 2).forEach(print);
  

  var cache = MapCache<String, String>();

  cache.set("key", "hello").then((_) => cache.get("key")).then(print);

  var counter = CountdownTimer(const Duration(milliseconds: 5000),
                const Duration(milliseconds: 1000));
                counter.listen(print);

  Metronome.epoch(aSecond).listen((d) => print(d));                
}
