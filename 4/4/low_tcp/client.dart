import 'dart:io';

main(List<String> args) {
  RawSocket.connect('127.0.0.1', 4041).then((socket) {
    socket.write(["A", "B","C"].map((v) => v.codeUnitAt(0)).toList());
  });
}