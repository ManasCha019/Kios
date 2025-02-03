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
      backgroundColor: const Color(0xFFFFF4E6),
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
                  color: const Color(0xFFFFF2CC),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MenuButton(
                            text: 'order_food'.tr,
                            onPressed: () {},
                            backgroundColor: Kios_colorsColors.red,
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
                      Image.asset(
                        'assets/images/thanvasu_logo.png',
                        width: 350,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
