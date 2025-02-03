import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kios App',
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
