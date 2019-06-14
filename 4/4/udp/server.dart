import 'dart:io';

main(List<String> args) {
  RawDatagramSocket.bind('127.0.0.1', 4041).then((socket){
      socket.listen((e){
        if(e == RawSocketEvent.read){
          var data = socket.receive();
          print(String.fromCharCodes(data.data));
        }
      });
  });
}