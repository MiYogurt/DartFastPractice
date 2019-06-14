import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf/shelf.dart';
import 'package:shelf_static/shelf_static.dart';
import 'package:http_multi_server/http_multi_server.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

main(List<String> arguments) async {
  var staticHandler = createStaticHandler('static', 
      defaultDocument: 'index.html', listDirectories: true);

  var wsHandler = webSocketHandler((webSocket) {
    webSocket.stream.listen((message) {
      webSocket.sink.add("echo $message");
    });
  });

  var handler = const Pipeline().addMiddleware(logRequests())
      .addHandler((req) async {
        print(req.url.path);
        if (req.url.path.contains("ws")) {
          return await wsHandler(req);
        }
        else if (req.url.path.contains("static")) {
          var staticData = await staticHandler(req.change(path: 'static'));
          return staticData;
        } else {
         return Response.ok("hello");
        }
      });


  await io.serve(handler, 'localhost', 8080);
  
  // HttpMultiServer([server1, server2]).listen((req){
  //   print(req);
  // }); // not work


}

// main(List<String> args) async {
//   var staticHandler = createStaticHandler('static', 
//       defaultDocument: 'index.html', listDirectories: true);

//   var wsHandler = webSocketHandler((webSocket) {
//     print(webSocket);
//     webSocket.stream.listen((message) {
//       webSocket.sink.add("echo $message");
//     });
//   });

//   var s1 = io.serve(staticHandler, "localhost", 8080, shared: true);

//   var s2 = io.serve(wsHandler, "localhost", 8080, shared: true);

//   // var stremReq = HttpMultiServer([s2, s1]);
//   // io.serveRequests(stremReq, )
// }
