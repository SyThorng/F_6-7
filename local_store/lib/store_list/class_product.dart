import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Product {
  late String name;
  late int qty;
  late double price;
  late double total;

  Product(this.name, this.qty, this.price, this.total);
}

class Product_controller extends GetxController {
  var products = <Product>[];
  addProductCard(Product product) {
    products.add(product);
    print('Object added');
    update();
  }
}
