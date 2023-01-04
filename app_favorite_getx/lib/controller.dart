import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class Cunter_controller extends GetxController {
  int number = 0.obs();
  int cound = 0.obs();
  int b = 0.obs();
  increment() {
    number++;
    update();
  }

  Decrement() {
    if (number == 0) {
      number = 0;
    } else if (number > 0) {
      number--;
    }
    update();
  }

  get() {
    number = 0;
  }

  var products = <Product_controller>[].obs();
  addProductCard(Product_controller product) {
    products.add(product);
    print('Succes..!!');
    cound++;
    get();
    update();
  }

  // get() {
  //   b = false;
  //   update();
  // }

}

class Product_controller {
  String? name;
  String? price;
  String? img;
  int? number;
  bool? b_b;
  Product_controller(
      {required this.img,
      required this.name,
      required this.price,
      required this.number,
      this.b_b});
}

class ThemeModeController extends GetxController {
  final box = GetStorage();
  bool get isDark => box.read('darkmode') ?? false;
  ThemeData get theme => isDark ? ThemeData.dark() : ThemeData.light();
  void changeTheme(bool val) => box.write('darkmode', val);
}
