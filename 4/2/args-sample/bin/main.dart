import 'package:cli_util/cli_logging.dart';
import 'package:args/args.dart';

// main(List<String> args) async {
//   bool verbose = args.contains('-v');
//   Logger logger = verbose ? new Logger.verbose() : new Logger.standard(); // 创建不同模式的日志

//   logger.stdout('Hello world!'); // 正常输入
//   logger.trace('message 1'); // 调试输出
//   await new Future.delayed(new Duration(milliseconds: 200)); // 延迟
//   logger.trace('message 2');
//   logger.trace('message 3');

//   Progress progress = logger.progress('doing some work'); // 创建进度条
//   await new Future.delayed(new Duration(seconds: 2));
//   progress.finish(showTiming: true); // 完成进度条

//   logger.stdout('All ${logger.ansi.emphasized('done')}.'); // 设置输出的样式
//   logger.flush(); // 清空缓存文字，都输出到控制台
// }


main(List<String> args) async {
  var parser = new ArgParser();
  parser.addOption('mode');
  parser.addFlag('verbose', defaultsTo: true);

  var clone = parser.addCommand("clone");

  clone.addFlag("private", defaultsTo: true);

  // var results = parser.parse(['--mode', 'debug', 'something', 'else']);

  // print(results['mode']); // debug
  // print(results['verbose']); // true
  // print(results.rest); // [something, else]

  var results = parser.parse(['clone', 'a', 'b', 'c']);

  print(results.command.name);
  print(results.command['private']);
  print(results.command.rest);
}