import 'dart:async';

// main(List<String> args) {
//   runZoned(() {
//     print(Zone.current[#foo]);
//   }, zoneValues: { #foo: "hello" });
// }

// main() {
//   runZoned(() {
//     print('red color text');
//   }, zoneSpecification: new ZoneSpecification(
//     print: (self, parent, zone, message) {
//       self.parent.print("\u001b[31m $message");
//     }));
// }

// main() {
//   runZoned(() {
//     print('red color text');
//   }, zoneSpecification: new ZoneSpecification(
//     print: (self, parent, zone, message) {
//       self.parent.print("\u001b[31m $message");
//     }));
// }

main(List<String> args) {
  List events = [];
  bool override = false;

  Zone forked = Zone.current.fork(specification: new ZoneSpecification(
      run: <R>(Zone self, ZoneDelegate parent, Zone origin, R f()) {
    events.add("2");
    if (!override) return parent.run(origin, f);
    return 42 as R;
  }));

  events.add("1");
  var result = forked.run(() {
    events.add("3");
    return 88;
  });

  print(result); // 88

  override = true; // 开启拦截
  
  var result2 = forked.run(() {
    events.add("not run"); // 没有运行
    return 200;
  });
  print(result2); // 42

  print(events);
}
