import 'package:Kios/controllers/memberNo_controller.dart';
import 'package:Kios/views/widgets/buttons/menu_button.dart';
import 'package:Kios/views/widgets/colors/basicflutter_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberNoPage extends GetView<MemberNoController> {
  const MemberNoPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MemberNoController());

    return Scaffold(
      backgroundColor: Kios_colorsColors.yellow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'member_no'.tr,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w200,
                ),
              ),
              const SizedBox(height: 50),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Center(
                        child: Obx(() => Text(
                              controller.memberNo.value.padRight(9, '*'),
                              style: const TextStyle(fontSize: 24),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    Row(
                      children: [
                        _buildNumberButton('1'),
                        _buildVerticalDivider(),
                        _buildNumberButton('2'),
                        _buildVerticalDivider(),
                        _buildNumberButton('3'),
                      ],
                    ),
                    _buildHorizontalDivider(),
                    Row(
                      children: [
                        _buildNumberButton('4'),
                        _buildVerticalDivider(),
                        _buildNumberButton('5'),
                        _buildVerticalDivider(),
                        _buildNumberButton('6'),
                      ],
                    ),
                    _buildHorizontalDivider(),
                    Row(
                      children: [
                        _buildNumberButton('7'),
                        _buildVerticalDivider(),
                        _buildNumberButton('8'),
                        _buildVerticalDivider(),
                        _buildNumberButton('9'),
                      ],
                    ),
                    _buildHorizontalDivider(),
                    Row(
                      children: [
                        _buildActionButton(),
                        _buildVerticalDivider(),
                        _buildNumberButton('0'),
                        _buildVerticalDivider(),
                        _buildOKButton(),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 32),
                  child: MenuButton(
                    text: 'skip'.tr,
                    onPressed: () => Get.back(),
                    backgroundColor: Colors.white,
                    width: 130,
                    height: 50,
                    fontColor: Colors.black,
                    useGradient: false,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return Expanded(
      child: InkWell(
        onTap: () => controller.addNumber(number),
        child: Container(
          height: 100,
          alignment: Alignment.center,
          child: Text(
            number,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton() {
    return Expanded(
      child: InkWell(
        onTap: () => controller.delete(),
        child: Container(
          height: 100,
          alignment: Alignment.center,
          child: const Icon(
            Icons.backspace_outlined,
            size: 24,
          ),
        ),
      ),
    );
  }

  Widget _buildOKButton() {
    return Expanded(
      child: MenuButton(
        text: 'ok'.tr,
        onPressed: () {
          if (controller.memberNo.value.length == 9) {
            Get.back(result: controller.memberNo.value);
          }
        },
        backgroundColor: Kios_colorsColors.red,
        width: 60,
        height: 100,
        fontColor: Colors.white,
        fontSize: 20,
        customStyle: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(8),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      width: 1,
      height: 100,
      color: Colors.black,
    );
  }

  Widget _buildHorizontalDivider() {
    return Container(
      height: 1,
      color: Colors.black,
    );
  }
}
