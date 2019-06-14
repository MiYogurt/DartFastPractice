import 'dart:io';

String localFile(path) => File(path).path;

SecurityContext serverContext = new SecurityContext()
  ..useCertificateChain(localFile('127.0.0.1.pem'))
  ..usePrivateKey(localFile('127.0.0.1-key.pem'));

main(List<String> arguments) {
  SecureServerSocket.bind("127.0.0.1", 9900, serverContext).then((server){
    server.listen((socket){
      socket.listen((data){
        print(data);
      });
    });
  });
}
