import 'package:get/get.dart';
import 'package:trade_app/view/screens/change_language/english.dart';
import 'package:trade_app/view/screens/change_language/spanish.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "en_US": english,
    "es_ES": spanish,
  };
}
