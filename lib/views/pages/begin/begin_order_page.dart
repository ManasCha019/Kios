import 'package:Kios/controllers/language_controller.dart';
import 'package:Kios/views/widgets/buttons/menu_button.dart';
import 'package:Kios/views/widgets/colors/basicflutter_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class BeginPage extends StatefulWidget {
  const BeginPage({super.key});

  @override
  State<BeginPage> createState() => _BeginPageState();
}

class _BeginPageState extends State<BeginPage> {
  late VideoPlayerController _controller;
  final languageController = Get.put(LanguageController());
  bool showOrderOptions = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/exam_video.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _controller.value.isInitialized
                  ? SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _controller.value.size.width,
                          height: _controller.value.size.height,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                    )
                  : Container(
                      color: Kios_colorsColors.black,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Kios_colorsColors.yellow,
              ),
              child: SizedBox(
                height: 0.35 * MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MenuButton(
                            text: showOrderOptions
                                ? 'dine_in'.tr
                                : 'order_food'.tr,
                            onPressed: () => showOrderOptions
                                ? Get.toNamed('/memberNo')
                                : setState(() => showOrderOptions = true),
                            backgroundColor: Kios_colorsColors.red,
                            fontColor: Kios_colorsColors.white,
                            useGradient: true,
                            icon: showOrderOptions
                                ? const Icon(Icons.restaurant,
                                    size: 40, color: Kios_colorsColors.white)
                                : null,
                          ),
                          const SizedBox(height: 15),
                          MenuButton(
                            text: 'change_language'.tr,
                            fontColor: Kios_colorsColors.black,
                            onPressed: () =>
                                languageController.changeLanguage(),
                            backgroundColor: Kios_colorsColors.white,
                            height: 100,
                            icon: const Icon(Icons.translate,
                                size: 40, color: Kios_colorsColors.black),
                          ),
                        ],
                      ),
                      showOrderOptions
                          ? MenuButton(
                              text: 'take_home'.tr,
                              onPressed: () => Get.toNamed('/memberNo'),
                              useGradient: true,
                              fontColor: Kios_colorsColors.white,
                              backgroundColor: Kios_colorsColors.red,
                              icon: const Icon(Icons.takeout_dining,
                                  size: 40, color: Kios_colorsColors.white),
                            )
                          : Transform.translate(
                              offset: const Offset(0, -30),
                              child: Image.asset(
                                'assets/images/thanvasu_logo.png',
                                width: 450,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
