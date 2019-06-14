import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'user.dart';

part 'serializers.g.dart';

@SerializersFor([
  User
])
final Serializers serializers = _$serializers;

final standardSerializers = (serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();
