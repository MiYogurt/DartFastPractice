import 'dart:io';
import 'dart:convert';

main(List<String> args) {
  ServerSocket.bind('127.0.0.1', 4041)
  .then((serverSocket) {
    serverSocket.listen((socket) {
      socket.transform(utf8.decoder).listen(print);
    });
  });
}