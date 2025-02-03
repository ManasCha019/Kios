import 'package:Kios/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final translations = AppTranslations();
  final trans = await translations.init();
  runApp(MyApp(translations: trans));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> translations;
  const MyApp({super.key, required this.translations});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kios App',
      debugShowCheckedModeBanner: false,
      translations: Messages(translations: translations),
      locale: const Locale('th', 'TH'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        fontFamily: 'Inter',
        textTheme: ThemeData.light().textTheme.apply(
              bodyColor: Colors.black,
              fontFamily: 'NotoSansThai',
            ),
      ),
      initialRoute: AppRoutes.INITIAL,
      getPages: AppRoutes.routes,
    );
  }
}

class Messages extends Translations {
  final Map<String, Map<String, String>> translations;
  Messages({required this.translations});

  @override
  Map<String, Map<String, String>> get keys => translations;
}
