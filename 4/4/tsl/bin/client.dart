import 'dart:io';

String localFile(path) => File(path).path;

main(List<String> args) {
  SecurityContext clientContext = new SecurityContext()
  ..setTrustedCertificates(localFile('/Users/yugo/Library/Application Support/mkcert/rootCA.pem'));

      SecureSocket
        .connect("127.0.0.1", 9900, context: clientContext)
        .then((socket) {
          socket.write("hello");
        });

}