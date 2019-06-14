import 'dart:io';

main(List<String> args) {
  RawServerSocket.bind('127.0.0.1', 4041)
  .then((serverSocket) {
    serverSocket.listen((socket) {
      socket.listen((event){
        if (event == RawSocketEvent.read) {
            var ret = socket.read();
            print(ret);
        }
      });
    });
  });
}