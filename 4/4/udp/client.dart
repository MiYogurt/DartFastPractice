import 'dart:io';
import 'dart:convert';

import 'dart:io' as prefix0;

main(List<String> args) {
  RawDatagramSocket.bind('127.0.0.1', 4042).then((socket){
      socket.send(utf8.encoder.convert('hello world'), InternetAddress('127.0.0.1'), 4041);
  });
}