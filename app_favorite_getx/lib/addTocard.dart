import 'package:app_favorite_getx/controller.dart';
import 'package:app_favorite_getx/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class add_card extends StatelessWidget {
  add_card({super.key});

  @override
  Widget build(BuildContext context) {
    var obj = Product();
    Cunter_controller controller = Get.put(Cunter_controller());
    return GetBuilder<Cunter_controller>(builder: (context) {
      return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(
                controller.products.length,
                (index) => InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(children: [
                          Container(
                            width: double.infinity,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(153, 158, 158, 158),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 160,
                              height: 110,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(controller
                                        .products[index].img
                                        .toString())),
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 220, top: 20),
                            child: Text(
                              controller.products[index].name.toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 220, top: 60),
                            child: Text(
                              'Price : ${controller.products[index].price.toString()}\$',
                              style: TextStyle(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 220, top: 95),
                            child: Text(
                              'Qty : ${controller.products[index].number.toString()}',
                              style: TextStyle(),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 320, top: 5),
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(132, 105, 94, 94),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite,
                                  color: controller.products[index].b_b == true
                                      ? Colors.red
                                      : Colors.white,
                                )),
                          ),
                        ]),
                      ),
                    )),
          ),
        ),
      );
    });
  }
}
