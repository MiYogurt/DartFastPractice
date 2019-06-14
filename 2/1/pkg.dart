import 'dart:math' deferred as mathImport;
import './lib/main.dart';

main(List<String> args) async {
  print(pi);
  await mathImport.loadLibrary();
  print(mathImport.e);
}