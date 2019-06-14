library builder_example.builder;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/a.dart';
import 'src/b.dart';
import 'src/c.dart';
import 'src/d.dart';

Builder myBuilder(BuilderOptions options) =>
    LibraryBuilder(MyGenerator(), generatedExtension: '.info.dart');

    
Builder productBuilder(BuilderOptions options) =>
    SharedPartBuilder([PropertyProductGenerator()], 'product');

Builder sumBuilder(BuilderOptions options) =>
    LibraryBuilder(PropertySumGenerator(), generatedExtension: '.sum.dart');

Builder multiplyBuilder(BuilderOptions options) =>
    LibraryBuilder(MultiplierGenerator(), generatedExtension: '.multiply.dart');
