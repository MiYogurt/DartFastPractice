library user;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import './serializers.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  User._();

  factory User([updates(UserBuilder b)]) = _$User;

  @BuiltValueField(wireName: 'username')
  String get username;
  @BuiltValueField(wireName: 'email')
  String get email;
  @BuiltValueField(wireName: 'gender')
  String get gender;  
  
  @BuiltValueField(wireName: 'books')
  BuiltSet<String> get books;

  String toJson() {
    return json.encode(standardSerializers.serializeWith(User.serializer, this));
  }

  static User fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        User.serializer, json.decode(jsonString));
  }

  static Serializer<User> get serializer => _$userSerializer;
}


