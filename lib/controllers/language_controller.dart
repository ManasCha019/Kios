import 'dart:ui';

import 'package:get/get.dart';

class LanguageController extends GetxController {
  void changeLanguage() {
    Get.updateLocale(
      Get.locale == const Locale('en', 'US')
          ? const Locale('th', 'TH')
          : const Locale('en', 'US'),
    );
  }
}
