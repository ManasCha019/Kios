import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuController extends GetxController {
  final RxString selectedMenu = 'home'.obs;
  final RxInt selectedCategoryIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    selectHome();
  }

  final RxList<Map<String, dynamic>> categoryItems = [
    {
      'catId': 1,
      'name': 'สเต็ก',
      'icon': Icons.restaurant,
      'onPressed': () {},
    },
    {
      'catId': 2,
      'name': 'สลัด',
      'icon': Icons.spa,
      'onPressed': () {},
    },
    {
      'catId': 3,
      'name': 'พาสต้า',
      'icon': Icons.ramen_dining,
      'onPressed': () {},
    },
    {
      'catId': 4,
      'name': 'ซุป',
      'icon': Icons.soup_kitchen,
      'onPressed': () {},
    },
    {
      'catId': 5,
      'name': 'เครื่องดื่ม',
      'icon': Icons.local_cafe,
      'onPressed': () {},
    },
  ].obs;

  final List<Map<String, dynamic>> menuItems = [
    // สเต็ก (Steak) items
    {
      'title': 'ริบอายสเต็ก',
      'price': 490.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'สเต็ก',
      'catId': 1,
    },
    {
      'title': 'ทีโบนสเต็ก',
      'price': 550.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'สเต็ก',
      'catId': 1,
    },
    {
      'title': 'เทนเดอร์ลอยสเต็ก',
      'price': 450.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'สเต็ก',
      'catId': 1,
    },
    {
      'title': 'พอร์คช็อป',
      'price': 320.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'สเต็ก',
      'catId': 1,
    },
    {
      'title': 'แลมบ์ช็อป',
      'price': 590.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'สเต็ก',
      'catId': 1,
    },

    // สลัด (Salad) items
    {
      'title': 'ซีซาร์สลัด',
      'price': 220.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'สลัด',
      'catId': 2,
    },
    {
      'title': 'กรีกสลัด',
      'price': 240.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'สลัด',
      'catId': 2,
    },
    {
      'title': 'สลัดแซลมอน',
      'price': 280.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'สลัด',
      'catId': 2,
    },
    {
      'title': 'ค็อบสลัด',
      'price': 260.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'สลัด',
      'catId': 2,
    },
    {
      'title': 'สลัดไก่ย่าง',
      'price': 220.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'สลัด',
      'catId': 2,
    },

    // พาสต้า (Pasta) items
    {
      'title': 'สปาเก็ตตี้คาโบนาร่า',
      'price': 220.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'พาสต้า',
      'catId': 3,
    },
    {
      'title': 'เฟตตูชินีอัลเฟรโด',
      'price': 240.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'พาสต้า',
      'catId': 3,
    },
    {
      'title': 'พาสต้าขี้เมา',
      'price': 220.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'พาสต้า',
      'catId': 3,
    },
    {
      'title': 'ลิงกวินีเพสโต้',
      'price': 250.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'พาสต้า',
      'catId': 3,
    },
    {
      'title': 'พาสต้าซีฟู้ด',
      'price': 280.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'พาสต้า',
      'catId': 3,
    },

    // ซุป (Soup) items
    {
      'title': 'ซุปครีมเห็ด',
      'price': 180.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'ซุป',
      'catId': 4,
    },
    {
      'title': 'ซุปหอมใหญ่',
      'price': 190.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'ซุป',
      'catId': 4,
    },
    {
      'title': 'ซุปข้าวโพด',
      'price': 160.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'ซุป',
      'catId': 4,
    },
    {
      'title': 'ซุปมินิสโตรเน',
      'price': 200.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'ซุป',
      'catId': 4,
    },
    {
      'title': 'ซุปทะเล',
      'price': 220.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'ซุป',
      'catId': 4,
    },

    // เครื่องดื่ม (Beverages) items
    {
      'title': 'มังกรชาเขียว',
      'price': 250.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
      'catId': 5,
    },
    {
      'title': 'ชานมไข่มุก',
      'price': 220.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
      'catId': 5,
    },
    {
      'title': 'สตรอเบอร์รี่ปั่น',
      'price': 180.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
      'catId': 5,
    },
    {
      'title': 'กาแฟลาเต้',
      'price': 160.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
      'catId': 5,
    },
    {
      'title': 'ช็อคโกแลตเย็น',
      'price': 190.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
      'catId': 5,
    },
    {
      'title': 'นมสดปั่น',
      'price': 150.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
      'catId': 5,
    },
    {
      'title': 'ชามะนาว',
      'price': 140.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
      'catId': 5,
    },
    {
      'title': 'น้ำส้มปั่น',
      'price': 170.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
      'catId': 5,
    },
    {
      'title': 'กาแฟเย็น',
      'price': 150.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
      'catId': 5,
    },
    {
      'title': 'ชาไทย',
      'price': 130.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
      'catId': 5,
    },
  ];
  void selectHome() {
    selectedMenu.value = 'home';
    selectedCategoryIndex.value = -1;
    update();
  }

  void selectNewItems() {
    selectedMenu.value = 'new';
    selectedCategoryIndex.value = -1;
    update();
  }

  void selectCategory(int index) {
    selectedMenu.value = 'category';
    selectedCategoryIndex.value = index;
    update();
  }

  bool isHomeSelected() {
    return selectedMenu.value == 'home';
  }

  bool isNewItemsSelected() {
    return selectedMenu.value == 'new';
  }

  bool isCategorySelected(int index) {
    return selectedMenu.value == 'category' &&
        selectedCategoryIndex.value == index;
  }

  List<Map<String, dynamic>> getFilteredItems() {
    if (selectedMenu.value != 'category' || selectedCategoryIndex.value == -1) {
      return menuItems;
    }
    final selectedCatId = categoryItems[selectedCategoryIndex.value]['catId'];
    return menuItems.where((item) => item['catId'] == selectedCatId).toList();
  }
}
