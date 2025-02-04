import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final RxList<Map<String, dynamic>> menuItems = [
    {
      'name': 'สเต็ก',
      'icon': Icons.restaurant,
      'onPressed': () {},
    },
    {
      'name': 'สลัด',
      'icon': Icons.spa,
      'onPressed': () {},
    },
    {
      'name': 'พาสต้า',
      'icon': Icons.ramen_dining,
      'onPressed': () {},
    },
    {
      'name': 'ซุป',
      'icon': Icons.soup_kitchen,
      'onPressed': () {},
    },
    {
      'name': 'เครื่องดื่ม',
      'icon': Icons.local_cafe,
      'onPressed': () {},
    },
  ].obs;
}
