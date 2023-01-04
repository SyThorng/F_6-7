import 'package:app_favorite_getx/controller.dart';
import 'package:app_favorite_getx/darkmode.dart';
import 'package:app_favorite_getx/show.dart';
import 'package:badges/badges.dart';
import 'package:badges/src/badge_animation_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import 'addTocard.dart';

class ui extends StatefulWidget {
  const ui({super.key});

  @override
  State<ui> createState() => _uiState();
}

class _uiState extends State<ui> {
  TextEditingController con_search = TextEditingController();

  bool b = false;
  @override
  Widget build(BuildContext context) {
    Cunter_controller controller = Get.put(Cunter_controller());
    return GetBuilder<Cunter_controller>(builder: (context) {
      return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.indigo,
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Category'),
          actions: [
            Stack(children: [
              IconButton(
                  onPressed: () {
                    Get.to(() => add_card());
                  },
                  icon: Icon(Icons.shopping_cart_sharp)),
              Container(
                margin: EdgeInsets.only(left: 30, top: 5),
                child: Badge(
                  shape: BadgeShape.square,
                  borderRadius: BorderRadius.circular(5),
                  position: BadgePosition.topEnd(top: -12, end: -20),
                  padding: EdgeInsets.all(2),
                  badgeContent: Text(
                    controller.cound.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ])
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.red))),
                  onChanged: (value) {
                    setState(() {
                      file_product = ls
                          .where((element) => element.name!
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.color_lens),
                  const Text(
                    'Food & Drink',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.to(() => dark_mode());
                      },
                      icon: const Icon(Icons.menu)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.account_balance_wallet_sharp)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 650,
                // color: Colors.amber,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.1),
                  itemCount: con_search.text.isEmpty || con_search.text == ''
                      ? ls.length
                      : file_product.length,
                  itemBuilder: (context, index) {
                    var pro = con_search.text.isEmpty || con_search.text == ''
                        ? ls[index]
                        : file_product[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => show(
                                img: pro.img,
                                name: pro.name,
                                price: pro.price,
                                bb: pro.b,
                              ),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(
                          children: [
                            Container(
                              width: 180,
                              height: 200,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(5, 5),
                                        color: Colors.blue,
                                        blurRadius: 4),
                                    BoxShadow(
                                        offset: Offset(-1, -1),
                                        color: Colors.blue,
                                        blurRadius: 4)
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(pro.img.toString()),
                                  )),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 165, left: 10),
                              child: Text(
                                pro.name.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 130, top: 150),
                              child: IconButton(
                                  onPressed: () {
                                    print('object');
                                  },
                                  icon: const Icon(Icons.shopping_cart_sharp)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 130, top: 5),
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      pro.b = true;
                                      controller.b = 1;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: pro.b == false
                                        ? Colors.white
                                        : Colors.red,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

List<Product> file_product = [];

List<Product> ls = [
  Product(
    b: false,
    price: '12.99',
    name: 'Berger',
    img:
        'https://www.citypng.com/public/uploads/small/11653330142nomoyttufhh9mpbp3uwcaibribaybreyh56xlbldfieqyoa1bglxt3kt1xhapvh9az6il50y228fmiw8zjsizxowpocn9vmifzb7.png',
  ),
  Product(
    b: false,
    price: '10.99',
    name: 'Pizza',
    img:
        'https://www.citypng.com/public/uploads/small/11665837973vkascnhtppsslqwlaqub9usapryebyq0q9nqli6566ejduj9e2dbf8uw4asppkyzztidmodjavdgy64evfvwso4jjyszn07trlwf.png',
  ),
  Product(
    b: false,
    price: '11.77',
    name: 'Cake',
    img: 'https://pngimg.com/uploads/chocolate_cake/chocolate_cake_PNG52.png',
  ),
  Product(
    b: false,
    price: '8.99',
    name: 'Coffee',
    img: 'https://www.pngkey.com/png/full/943-9430047_coffee.png',
  ),
  Product(
    b: false,
    price: '5.88',
    name: 'hot Lette',
    img:
        'https://www.pngitem.com/pimgs/m/57-570635_latte-coffee-png-transparent-png.png',
  ),
];

class Product {
  String? name;
  String? img;
  String? price;
  bool? b;
  Product({this.name, this.img, this.price, this.b});
}
