import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class cunter_controller extends GetxController {
  int number = 0.obs();
  increment() {
    number++;
    // Get.showSnackbar('');
    update();
  }

  decrement() {
    number--;
    update();
  }
}
