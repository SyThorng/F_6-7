import 'package:app_favorite_getx/addTocard.dart';
import 'package:app_favorite_getx/controller.dart';
import 'package:app_favorite_getx/darkmode.dart';
import 'package:app_favorite_getx/show.dart';
import 'package:app_favorite_getx/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

// void main(List<String> args) {
//   runApp(App());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeModeController controller = Get.put(ThemeModeController());

    return GetMaterialApp(
      //  initialRoute: controller,
      home: ui(),
      debugShowCheckedModeBanner: false,
    );
  }
}
