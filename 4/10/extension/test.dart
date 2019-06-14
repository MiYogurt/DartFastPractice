import 'sample_synchronous_extension.dart';

main(List<String> args) {
  systemSrand(DateTime.now().microsecond); 
  var nums = systemRand();
  print(nums);
  print(StrToMap("bobo"));
}