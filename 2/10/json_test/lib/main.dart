import 'model/user.dart';

main(List<String> args) {
  var user = User.fromJson("""
  {
    "username": "yugo",
    "email": "belovedyogurt@gmail.com",
    "gender": "male"
  }
  """);
  print(user.email);                                                                         
  print(user.toJson());

  print(user.rebuild((b) => b..email="xxqq.com").toJson());


  var b = user.toBuilder();
  b.email = "xxxaaa.com";
  b.books.withBase(() => {"hello", "hello"});
  print(b.build().toJson());
}