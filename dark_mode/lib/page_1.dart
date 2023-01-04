import 'package:dark_mode/cunter.dart';
import 'package:dark_mode/dark.dart.dart';
import 'package:dark_mode/font_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

class page_1 extends StatefulWidget {
  page_1({super.key});

  @override
  State<page_1> createState() => _page_1State();
}

class _page_1State extends State<page_1> {
  FontsController controller = Get.put(FontsController());
  @override
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FontsController>(
        init: controller,
        builder: (context) {
          return Scaffold(
            body: Column(),
            appBar: AppBar(
              title: Text(
                'Title',
                style: TextStyle(fontFamily: controller.fontData),
              ),
            ),
            drawer: Drawer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Lottie.network(
                        'https://assets5.lottiefiles.com/packages/lf20_mx9a6qqo.json'),
                    margin: const EdgeInsets.only(left: 20),
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(() => const dark());
                    },
                    leading: const Icon(Icons.settings),
                    title: Text(
                      'Setting'.tr,
                      style: TextStyle(fontFamily: controller.fontData),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.public),
                    title: Text(
                      'Community'.tr,
                      style: TextStyle(fontFamily: controller.fontData),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      'About me'.tr,
                      style: TextStyle(fontFamily: controller.fontData),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
