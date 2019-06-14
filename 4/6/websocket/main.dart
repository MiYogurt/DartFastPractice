import 'dart:io';

main(List<String> args) async {
  var server = await HttpServer.bind('127.0.0.1', 4040);
  server.listen((HttpRequest req) async {
    print(req.headers);
    var socket = await WebSocketTransformer.upgrade(req);
    print(req.response.headers);
    socket.add("hello"); // 发送数据
    socket.listen((conn){ // 接受数据
      print(conn);
    });
  });
}