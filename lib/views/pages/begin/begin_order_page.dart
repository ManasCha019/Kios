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
                      color: Colors.black,
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
                    crossAxisAlignment: showOrderOptions
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MenuButton(
                            text: showOrderOptions
                                ? 'dine_in'.tr
                                : 'order_food'.tr,
                            onPressed: () => setState(
                                () => showOrderOptions = !showOrderOptions),
                            backgroundColor: Kios_colorsColors.red,
                            fontColor: showOrderOptions ? Colors.white : null,
                            icon: showOrderOptions
                                ? const Icon(Icons.restaurant,
                                    size: 40, color: Colors.white)
                                : null,
                          ),
                          const SizedBox(height: 15),
                          MenuButton(
                            text: 'change_language'.tr,
                            onPressed: () =>
                                languageController.changeLanguage(),
                            backgroundColor: Colors.white,
                            height: 100,
                            icon: const Icon(Icons.translate,
                                size: 40, color: Colors.black),
                          ),
                        ],
                      ),
                      showOrderOptions
                          ? MenuButton(
                              text: 'take_home'.tr,
                              onPressed: () {},
                              fontColor: Colors.white,
                              backgroundColor: Kios_colorsColors.red,
                              icon: const Icon(Icons.takeout_dining,
                                  size: 40, color: Colors.white),
                            )
                          : Image.asset(
                              'assets/images/thanvasu_logo.png',
                              width: 400,
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
