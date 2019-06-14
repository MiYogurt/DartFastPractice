import 'package:intl/intl.dart';
import 'i10n/messages_all.dart';
import 'strings.dart';

main(List<String> args) async {
  await initializeMessages('enUs');
  // Intl.defaultLocale = 'enUs';
  Intl.defaultLocale = 'message';
  print(getGenderMessage("female"));
}