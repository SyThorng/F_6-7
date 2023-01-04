import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontsController extends GetxController {
  initFonts() async {
    final prefs = await SharedPreferences.getInstance();
    fontData = prefs.getString('fonts') ?? ''.obs();
    update();
  }

  List? fontDataList = ['', 'Angkor', 'Rub', 'Pac'].obs();
  String? fontData;
  changeFonts(int fontIndex) async {
    final prefs = await SharedPreferences.getInstance();
    fontData = fontDataList![fontIndex];
    await prefs.setString('fonts', fontData!);
    update();
  }
}
