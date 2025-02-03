import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {};

  Future<Map<String, Map<String, String>>> init() async {
    Map<String, Map<String, String>> translations = {};
    var locales = ['en_US', 'th_TH'];

    for (String locale in locales) {
      String content =
          await rootBundle.loadString('assets/locales/$locale.json');
      Map<String, dynamic> json = jsonDecode(content);
      translations[locale] = Map<String, String>.from(json);
    }

    return translations;
  }
}
