import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:get/get.dart';

class TranslationService extends Translations {
  Map<String, Map<String, String>> _translations = {};

  Future<void> loadTranslations() async {
    for (String locale in ['en_US', 'th_TH']) {
      String content =
          await rootBundle.loadString('assets/locales/$locale.json');
      Map<String, dynamic> json = jsonDecode(content);
      _translations[locale] = Map<String, String>.from(json);
    }
  }

  @override
  Map<String, Map<String, String>> get keys => _translations;
}
