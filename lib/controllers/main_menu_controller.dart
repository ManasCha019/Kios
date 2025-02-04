import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final RxList<Map<String, dynamic>> categoryItems = [
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
  final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'มังกรชาเขียว',
      'price': 250.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
    },
    {
      'title': 'ชานมไข่มุก',
      'price': 220.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
    },
    {
      'title': 'สตรอเบอร์รี่ปั่น',
      'price': 180.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
    },
    {
      'title': 'กาแฟลาเต้',
      'price': 160.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
    },
    {
      'title': 'ช็อคโกแลตเย็น',
      'price': 190.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
    },
    {
      'title': 'นมสดปั่น',
      'price': 150.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
    },
    {
      'title': 'ชามะนาว',
      'price': 140.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
    },
    {
      'title': 'น้ำส้มปั่น',
      'price': 170.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
    },
    {
      'title': 'กาแฟเย็น',
      'price': 150.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
    },
    {
      'title': 'ชาไทย',
      'price': 130.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
    },
  ];
}
