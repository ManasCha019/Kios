import 'package:Kios/controllers/language_controller.dart';
import 'package:Kios/controllers/main_menu_controller.dart';
import 'package:Kios/views/widgets/buttons/menu_button.dart';
import 'package:Kios/views/widgets/buttons/side_menu_button.dart';
import 'package:Kios/views/widgets/colors/basicflutter_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuOrderPage extends StatefulWidget {
  const MainMenuOrderPage({super.key});

  @override
  State<MainMenuOrderPage> createState() => _MainMenuOrderPageState();
}

class _MainMenuOrderPageState extends State<MainMenuOrderPage> {
  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kios_colorsColors.yellow,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/thanvasu_logo.png',
                    height: 600,
                  ),
                  const SizedBox(width: 50),
                  Text(
                    'main_page'.tr,
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 200,
                    padding: const EdgeInsets.only(
                      top: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Kios_colorsColors.red,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(12)),
                          ),
                          child: SideMenuButton(
                            text: 'main_page'.tr,
                            icon: Icons.home,
                            onPressed: () {},
                            isSelected: true,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(12)),
                          ),
                          child: SideMenuButton(
                            text: 'new_items'.tr,
                            icon: Icons.star_border,
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(height: 24),
                        GetBuilder<MainMenuController>(
                          builder: (controller) => ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.menuItems.length,
                            itemBuilder: (context, index) {
                              final menuItem = controller.menuItems[index];

                              BorderRadius? borderRadius;
                              if (index == 0) {
                                borderRadius = BorderRadius.only(
                                    topRight: Radius.circular(12));
                              } else if (index ==
                                  controller.menuItems.length - 1) {
                                borderRadius = BorderRadius.only(
                                    bottomRight: Radius.circular(12));
                              }

                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: borderRadius,
                                  border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey.shade200),
                                  ),
                                ),
                                child: SideMenuButton(
                                  text: menuItem['name'],
                                  icon: menuItem['icon'],
                                  onPressed: () {
                                    controller.selectedIndex.value = index;
                                    menuItem['onPressed']();
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                          ),
                          child: SideMenuButton(
                            text: 'change_language'.tr,
                            icon: Icons.translate,
                            onPressed: () =>
                                languageController.changeLanguage(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      // Content area
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, -2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.shopping_cart),
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Kios_colorsColors.yellow,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text('3'),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '฿ 750',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  MenuButton(
                    text: 'cancel_order'.tr,
                    onPressed: () {},
                    backgroundColor: Kios_colorsColors.white,
                    width: 150,
                    height: 50,
                    fontColor: Kios_colorsColors.red,
                    fontSize: 16,
                    borderColor: Kios_colorsColors.red,
                    borderRadius: BorderRadius.circular(50),
                    borderWidth: 2.0,
                  ),
                  const SizedBox(width: 8),
                  MenuButton(
                    text: 'payment'.tr,
                    onPressed: () {},
                    backgroundColor: Kios_colorsColors.red,
                    width: 150,
                    height: 50,
                    fontColor: Kios_colorsColors.white,
                    fontSize: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
