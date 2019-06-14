import 'dart:io';
import 'dart:convert';

class FormDataItem {
  String disposition;
  String name;
  String value;
  FormDataItem({this.disposition,this.name, this.value});
}

main() {
  ServerSocket.bind("127.0.0.1", 4000)
    .then((serverSocket) {
      HttpServer httpserver = new HttpServer.listenOn(serverSocket);
      httpserver.listen((req) {
        // print(req.requestedUri); // http://localhost:4000/a/b/c?d=123
        // print(req.uri); // /a/b/c?d=123
        // print(req.method); // GET
        // print(req.session); // HttpSession instance
        // print(req.cookies); // []
        // print(req.connectionInfo); // HttpConnectionInfo instace
        // print(req.headers); // 各种请求头
        req.transform(utf8.decoder).listen((data) async {
          var boundary = req.headers.contentType.parameters['boundary'];
          print(data); // 接受到的数据
          var splied = data.split("--"+boundary);
          splied.removeWhere((v) => v.contains("--") || v == "");
          splied.forEach((item) {
            var disposition = RegExp("Content-Disposition: (.*);").allMatches(item).first.group(1);
            var name = RegExp("name=\"(.*)\"").allMatches(item).first.group(1);
            var value = RegExp(r'\n(.+)').allMatches(item).last.group(1);
            print(disposition);
            print(name);
            print(value);
          });
          req.response.write("hello");
          req.response.statusCode = 200;
          req.cookies + [Cookie("name", "yugo")];
          req.headers.contentType = ContentType.html;
          await req.response.close();
        });
      });
    });
}