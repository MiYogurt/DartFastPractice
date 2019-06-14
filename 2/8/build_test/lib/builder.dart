import 'dart:async';
import 'package:build/build.dart';
import 'package:sass/sass.dart';

class SassBuilder implements Builder {
  Future build(BuildStep buildStep) async {
    var assetId = buildStep.inputId;
    AssetId(buildStep.inputId.package, "web/a.css");

    print(assetId);
    
    var content = await buildStep.readAsString(assetId);
    var cssContent = await compileString(content);
    await buildStep.writeAsString(assetId.changeExtension(".css"), cssContent);
  }

  Map<String, List<String>> get buildExtensions => const {
    ".scss": ['.css'],
    ".sass": ['.css'],
  };
}


Builder sassBuilder(BuilderOptions option) => SassBuilder();