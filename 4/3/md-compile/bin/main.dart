import 'package:path/path.dart' as Path;
import 'package:markdown/markdown.dart';
import 'dart:io';

main(List<String> arguments) {
  var outPutFolder = Path.join('html'); // 输出的目录路径
  var sourceFolder = Path.join('docs'); // 源码目录路径
 
  var sourceFolderDir = Directory(sourceFolder); // 创建目录对象
  sourceFolderDir.watch(recursive: true).listen((event) { // 监听修改
    var mdPath = event.path;
    print(mdPath);
    var outPutName = Path.basenameWithoutExtension(mdPath); // 只拿到名字，并且不包含后缀
    var content = File(event.path).readAsStringSync(); // 读取内容

    Uri output = Uri.file(Path.join(outPutFolder, '$outPutName.html')); // 创建 url
    File.fromUri(output) // 通过 uri 创建文件
      ..createSync() // 创建文件
      ..writeAsStringSync(markdownToHtml(content)); // 输入内容
  });
}
