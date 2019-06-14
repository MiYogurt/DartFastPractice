
import 'dart:async';
import 'dart:convert';

Future<void> sayHello() async {
  var val = await Future.value(20);
}


Stream<num> getRange3(num end) async * {
  for (var i = 0; i < end; i++) {
    yield i;
  }
}

Stream<num> getRange2(num end) {
  return Stream.fromIterable(Iterable.generate(end, (v) => v));
}

Stream<num> getRange1(num end) {
  var scl = StreamController();
  for (var i = 0; i < end; i++) {
    scl.sink.add(i);
  }
  return scl.stream;
}


main(List<String> args) {
  // var ctl = Completer(); // scheduleMicrotask
  // var ctl2 = Completer.sync();


  // ctl.future.then(print);
  // ctl2.future.then(print);

  // ctl.complete("some");
  // ctl.completeError("error");

  // Future a = Future.value("hello");
  // Future.value(10)
  // .then((v) => print(v))
  // .catchError((e) => print(e))
  // .whenComplete((){
  //   print("finish");
  // });

  // Future.value(20)
  // .then((v) => 30) // v 是上面的 20
  // .then((v) => Future.value(40)) // v 是上面的 30
  // .then((v) => print(v)); // v 为 40

  // Future.delayed(Duration(milliseconds: 1000));
  // // Future.error("error");
  // Future.sync(() => 20);

  // Future.wait([a]);

  // Future.microtask((){
  //   return 2;
  // }).then(print);

  // Future.forEach([9,8,7], (v){
  //   print(v);
  //   return Future.value(v);
  // });

  // Future.any([Future.value(88),Future.value(99)]).then(print);

  // scheduleMicrotask((){
  //   Future.value(1).then(print);
  // });

  // scheduleMicrotask((){
  //   print("hello");
  // });

  // var s1 = StreamController.broadcast();
  // s1.stream.listen(print);
  // s1.stream.listen(print);
  // s1.sink.add(1);

  var s2 = Stream.fromFutures([Future.value(1)]);
  var s4 = Stream.periodic(Duration(seconds: 1));
  var s5 = Stream<String>.eventTransformed(s4, (sink) => LogSink(sink));
  // s5.listen(print);
  var s3 = Stream.fromFuture(Future.value(2));
  var s7 = s3.asyncExpand((i) => Stream.fromFuture(Future.value(i + 1)));
  var s8 = Stream.fromFuture(Future.value(2)).expand((i) => [i, i]);
  s7.toList().then(print);
  s8.toList().then(print);
  LineSplitter;
  var ctl2 = StreamController<int>();
  var stream1 = Stream.fromIterable([1,2,3]);
  // stream1.pipe(ctl2.sink);
  ctl2.addStream(stream1);

  // stream1.timeout(Duration(seconds: 1), onTimeout: (sink){
  //   print("time out");
  // });

  // stream1.asBroadcastStream();

  // stream1.drain();
  // Stream.fromIterable([1,2,2,3]).distinct().toList().then(print); // [1,2,3]
  // var transformer = StreamTransformer.fromBind((s) => s);
  // StreamTransformer.fromHandlers(
  //   handleData: (v, sink){
  //     sink.add(v * 2);
  //   },
  //   handleDone: (sink){},
  //   handleError: (obj,errStack, sink){},
  // );
  // stream1.transform(transformer);

  Stream.fromIterable([1,2,3]).map((v) => v+1).toList().then(print);
} 

class LogSink implements EventSink<String> {
  final EventSink<String> _outputSink;
  LogSink(this._outputSink);
  void add(String data) {
    print(">>>>>> the data is $data");
    _outputSink.add(data);
  }
  void addError(e, [st]) { _outputSink.addError(e, st); }
  void close() { _outputSink.close(); }
}