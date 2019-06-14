import 'dart:io';
import 'dart:isolate';

// main(List<String> args) {
//   var recivePort = ReceivePort(); 
//   Isolate.spawnUri(Uri.parse("good.dart"), ["a", "b"], "recivePort.sendPort");
// }


// main(List<String> args) async {
//   var recivePort = ReceivePort(); 
//   var isolate = await Isolate.spawn(SayHello, recivePort.sendPort);
//   recivePort.listen((msg){
//     print(msg);
//     isolate.kill();
//     exit(1);
//   });
// }

// void SayHello(SendPort send){
//   send.send("hello");
// }

main(List<String> args) async {
  var recivePort = ReceivePort(); 
  SendPort sender = null;
  await Isolate.spawn(SayHello, recivePort.sendPort);
  recivePort.listen((msg){
    if(sender == null && msg is SendPort){
      sender = msg;
      return;
    }
    print("parent recive: $msg");
    sender.send("to child: $msg");
  });
}

void SayHello(SendPort send){
  var recivePort = ReceivePort();
  send.send(recivePort.sendPort);
  recivePort.listen((msg){
    print("from parent");
    print(msg);
  });

  print("send hello to parent");
  send.send("hello");
}