import 'dart:ffi';

main(List<String> args) {
  Pointer<Int64> p1 = allocate<Int64>(count: 2); // 长度为 2 的
  print('p1 address: ${p1.address}');

  Pointer<Int64> p2 = p1.elementAt(1);
  print('p1.elementAt(1) address: ${p2.address}');
  p2.store(100);

  Pointer<Int64> p3 = p1.offsetBy(8);
  print('p1.offsetBy(8) address: ${p3.address}');
  print('p1.offsetBy(8) value: ${p3.load<int>()}');
  p1.free();

  Pointer<Pointer<Int8>> pointerToPointer = allocate();
  Pointer<Int8> value = allocate();
  pointerToPointer.store(value);
  value = pointerToPointer.load();
  print(value.load<int>());
}