import 'dart:io';

main(List<String> args) {
  Socket.connect('127.0.0.1', 4041).then((socket) {
    socket.write('Hello, World!');
  });
}