import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuController extends GetxController {
  final RxString selectedMenu = 'home'.obs;
  final RxInt selectedCategoryIndex = (-1).obs;
  final RxString selectedFilter = 'all'.obs;

  @override
  void onInit() {
    super.onInit();
    selectHome();
  }

  final Map<int, List<Map<String, dynamic>>> categoryFilters = {
    1: [
      // สเต็ก
      {'id': 'all', 'name': 'ทั้งหมด'},
      {'id': 'beef', 'name': 'เนื้อวัว'},
      {'id': 'pork', 'name': 'หมู'},
      {'id': 'lamb', 'name': 'แกะ'},
    ],
    2: [
      // สลัด
      {'id': 'all', 'name': 'ทั้งหมด'},
      {'id': 'chicken', 'name': 'ไก่'},
      {'id': 'seafood', 'name': 'ทะเล'},
      {'id': 'pork', 'name': 'หมู'},
      {'id': 'vegan', 'name': 'มังสวิรัติ'},
    ],
    3: [
      // พาสต้า
      {'id': 'all', 'name': 'ทั้งหมด'},
      {'id': 'cream', 'name': 'ครีมซอส'},
      {'id': 'spicy', 'name': 'ผัดขี้เมา'},
      {'id': 'pesto', 'name': 'เพสโต้'},
      {'id': 'seafood', 'name': 'ทะเล'},
    ],
    4: [
      // ซุป
      {'id': 'all', 'name': 'ทั้งหมด'},
      {'id': 'cream', 'name': 'ครีมซุป'},
      {'id': 'clear', 'name': 'น้ำใส'},
      {'id': 'seafood', 'name': 'ทะเล'},
    ],
    5: [
      // เครื่องดื่ม
      {'id': 'all', 'name': 'ทั้งหมด'},
      {'id': 'coffee', 'name': 'กาแฟ'},
      {'id': 'tea', 'name': 'ชา'},
      {'id': 'frappe', 'name': 'ปั่น'},
      {'id': 'chocolate', 'name': 'ช็อคโกแลต'},
    ],
  };

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
      'type': 'beef'
    },
    {
      'title': 'ทีโบนสเต็ก',
      'price': 550.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'สเต็ก',
      'catId': 1,
      'type': 'beef'
    },
    {
      'title': 'เทนเดอร์ลอยสเต็ก',
      'price': 450.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'สเต็ก',
      'catId': 1,
      'type': 'beef'
    },
    {
      'title': 'พอร์คช็อป',
      'price': 320.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'สเต็ก',
      'catId': 1,
      'type': 'pork'
    },
    {
      'title': 'แลมบ์ช็อป',
      'price': 590.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'สเต็ก',
      'catId': 1,
      'type': 'lamb'
    },

    // สลัด (Salad) items
    {
      'title': 'ซีซาร์สลัด',
      'price': 220.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'สลัด',
      'catId': 2,
      'type': 'chicken'
    },
    {
      'title': 'กรีกสลัด',
      'price': 240.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'สลัด',
      'catId': 2,
      'type': 'vegan'
    },
    {
      'title': 'สลัดแซลมอน',
      'price': 280.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'สลัด',
      'catId': 2,
      'type': 'seafood'
    },
    {
      'title': 'ค็อบสลัด',
      'price': 260.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'สลัด',
      'catId': 2,
      'type': 'pork'
    },
    {
      'title': 'สลัดไก่ย่าง',
      'price': 220.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'สลัด',
      'catId': 2,
      'type': 'chicken'
    },

    // พาสต้า (Pasta) items
    {
      'title': 'สปาเก็ตตี้คาโบนาร่า',
      'price': 220.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'พาสต้า',
      'catId': 3,
      'type': 'cream'
    },
    {
      'title': 'เฟตตูชินีอัลเฟรโด',
      'price': 240.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'พาสต้า',
      'catId': 3,
      'type': 'cream'
    },
    {
      'title': 'พาสต้าขี้เมา',
      'price': 220.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'พาสต้า',
      'catId': 3,
      'type': 'spicy'
    },
    {
      'title': 'ลิงกวินีเพสโต้',
      'price': 250.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'พาสต้า',
      'catId': 3,
      'type': 'pesto'
    },
    {
      'title': 'พาสต้าซีฟู้ด',
      'price': 280.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'พาสต้า',
      'catId': 3,
      'type': 'seafood'
    },

    // ซุป (Soup) items
    {
      'title': 'ซุปครีมเห็ด',
      'price': 180.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'ซุป',
      'catId': 4,
      'type': 'cream'
    },
    {
      'title': 'ซุปหอมใหญ่',
      'price': 190.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'ซุป',
      'catId': 4,
      'type': 'cream'
    },
    {
      'title': 'ซุปข้าวโพด',
      'price': 160.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'ซุป',
      'catId': 4,
      'type': 'cream'
    },
    {
      'title': 'ซุปมินิสโตรเน',
      'price': 200.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'ซุป',
      'catId': 4,
      'type': 'clear'
    },
    {
      'title': 'ซุปทะเล',
      'price': 220.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'ซุป',
      'catId': 4,
      'type': 'seafood'
    },

    // เครื่องดื่ม (Beverages) items
    {
      'title': 'มังกรชาเขียว',
      'price': 250.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
      'catId': 5,
      'type': 'tea'
    },
    {
      'title': 'ชานมไข่มุก',
      'price': 220.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
      'catId': 5,
      'type': 'tea'
    },
    {
      'title': 'สตรอเบอร์รี่ปั่น',
      'price': 180.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
      'catId': 5,
      'type': 'frappe'
    },
    {
      'title': 'กาแฟลาเต้',
      'price': 160.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
      'catId': 5,
      'type': 'coffee'
    },
    {
      'title': 'ช็อคโกแลตเย็น',
      'price': 190.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
      'catId': 5,
      'type': 'chocolate'
    },
    {
      'title': 'นมสดปั่น',
      'price': 150.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
      'catId': 5,
      'type': 'frappe'
    },
    {
      'title': 'ชามะนาว',
      'price': 140.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
      'catId': 5,
      'type': 'tea'
    },
    {
      'title': 'น้ำส้มปั่น',
      'price': 170.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
      'catId': 5,
      'type': 'frappe'
    },
    {
      'title': 'กาแฟเย็น',
      'price': 150.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
      'catId': 5,
      'type': 'coffee'
    },
    {
      'title': 'ชาไทย',
      'price': 130.0,
      'imagePath': 'assets/images/exam_menu.png',
      'category': 'เครื่องดื่ม',
      'catId': 5,
      'type': 'tea'
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
    selectedFilter.value = 'all';
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

    var items = menuItems
        .where((item) =>
            item['catId'] ==
            categoryItems[selectedCategoryIndex.value]['catId'])
        .toList();

    if (selectedFilter.value != 'all') {
      items =
          items.where((item) => item['type'] == selectedFilter.value).toList();
    }

    return items;
  }

  List<Map<String, dynamic>> getCurrentFilters() {
    if (selectedMenu.value != 'category' || selectedCategoryIndex.value == -1) {
      return [];
    }
    final catId = categoryItems[selectedCategoryIndex.value]['catId'];
    return categoryFilters[catId] ?? [];
  }

  void selectFilter(String filterId) {
    selectedFilter.value = filterId;
    update();
  }
}
