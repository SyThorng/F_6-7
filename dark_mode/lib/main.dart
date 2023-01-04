import 'package:dark_mode/cunter.dart';
import 'package:dark_mode/dark.dart.dart';
import 'package:dark_mode/faceid/test.dart';
import 'package:dark_mode/font_controller.dart';
import 'package:dark_mode/page_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

void main(List<String> args) async {
  await GetStorage.init();
  runApp(Myapp());
}

FontsController font_controller = Get.put(FontsController());

class Myapp extends StatelessWidget {
  Myapp({super.key});
  final themedata = GetStorage();
  final theme = GetStorage();
  @override
  Widget build(BuildContext context) {
    bool darkmode = themedata.read('Darkmode') ?? false;
    bool lang = themedata.read('lang') ?? false;
    return SimpleBuilder(builder: (context) {
      return GetMaterialApp(
        translations: localString(),
        locale: lang ? Locale('en', 'kh') : Locale('en', 'us'),
        theme: darkmode ? ThemeData.dark() : ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: page_1(),
        // home: MyHomePage(),
        initialRoute: font_controller.initFonts().toString(),
      );
    });
  }
}
