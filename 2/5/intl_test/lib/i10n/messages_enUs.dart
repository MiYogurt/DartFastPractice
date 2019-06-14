// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a enUs locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

// ignore: unnecessary_new
final messages = new MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'enUs';

  static m0(theNum) => "${Intl.plural(theNum, zero: '零', one: '壹', other: '其他')}";

  static m1(gender) => "${Intl.gender(gender, female: 'female', male: 'male.', other: 'other')}";

  static m2(msg) => "hello ${msg}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "counterMessage" : m0,
    "getGenderMessage" : m1,
    "helloMessage" : m2
  };
}
