import 'package:app_favorite_getx/addTocard.dart';
import 'package:app_favorite_getx/controller.dart';
import 'package:app_favorite_getx/ui.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class show extends StatefulWidget {
  show(
      {super.key,
      required this.img,
      required this.name,
      required this.price,
      this.bb});

  String? price;
  String? img;
  String? name;
  bool? bb;
  @override
  State<show> createState() => _showState();
}

class _showState extends State<show> {
  Cunter_controller controller = Get.put(Cunter_controller());
  // Product_controller controller_pro=Get.put(Product_controller(img: img, name: name, price: price, number: number))
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: controller,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
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
              title: Text('${widget.name}'),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage('${widget.img}'))),
                ),
                Text('Price : ${widget.price.toString()} \$'),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.blue)),
                  child: Text('${widget.img}'),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 270, top: 100),
                  child: MaterialButton(
                    onPressed: () {},
                    child: const Text('Buy Now'),
                    color: Colors.blue,
                  ),
                )
              ],
            ),
            bottomSheet: Container(
              width: double.infinity,
              height: 70,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.favorite),
                  Container(
                    child: MaterialButton(
                      onPressed: () => controller.addProductCard(
                        Product_controller(
                            price: widget.price,
                            img: widget.img,
                            name: widget.name,
                            number: controller.number,
                            b_b: widget.bb),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.shopping_cart_sharp),
                          Text('Add to Card'),
                        ],
                      ),
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Container(
              margin: const EdgeInsets.only(bottom: 200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      controller.Decrement();
                    },
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Text(
                      controller.number.toString(),
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      controller.increment();
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
