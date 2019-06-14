library sample_synchronous_extension;

import 'dart-ext:sample_extension';

int systemRand() native "SystemRand";
bool systemSrand(int seed) native "SystemSrand";
String StrToMap(String msg) native "StrToMap";