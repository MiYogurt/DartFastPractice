import 'dart:io';

main(List<String> args) async {
  // var result = Process.runSync("git", ["--version"]);
  // print(result.pid);
  // print(result.stdout);
  // var ret = Process.killPid(result.pid, ProcessSignal.sighup);
  // print(ret);

  // Process.run("live-server", ['.']).then((result){
  //   stdout.addStream(result.stdout); // 没效果
  //   stderr.addStream(result.stderr); // 没效果
  // });

  // Process.start("live-server", ['.']).then((result){
  //   stdout.addStream(result.stdout); 
  //   stderr.addStream(result.stderr);
  // });

  // 文件日志
  // await Process.start("live-server", ['.']).then((result){
  //   var file = File('log.txt');
  //   var sink = file.openWrite();
  //   sink.addStream(result.stdout);
  // });

  // 后台运行
  await Process.start("live-server", ['.'], runInShell: true , mode:    ProcessStartMode.detached).then((result){
    var file = File('log.txt');
    var sink = file.openWrite();
    sink.addStream(result.stdout);
  });

  print('exit');
}