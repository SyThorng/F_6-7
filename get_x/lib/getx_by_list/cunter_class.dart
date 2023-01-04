import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Product_Controller extends GetxController {
  var products = <Product>[].obs();
  addProductCard(Product product) {
    products.add(product);
    // print('Success..!!');
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sucess')));
    update();
  }
}

class Product {
  int? id;
  String? name;
  int? qty;
  double? price;
  double? total;

  Product({
    required this.id,
    required this.name,
    required this.qty,
    required this.price,
    required this.total,
  });
}
