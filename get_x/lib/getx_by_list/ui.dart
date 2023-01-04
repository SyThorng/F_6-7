import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get_x/getx_by_list/cunter_class.dart';
import 'package:get_x/getx_by_list/show.dart';

class ui extends StatefulWidget {
  const ui({super.key});

  @override
  State<ui> createState() => _uiState();
}

class _uiState extends State<ui> {
  @override
  Widget build(BuildContext context) {
    TextEditingController name_controller = TextEditingController();
    TextEditingController qty_controller = TextEditingController();
    TextEditingController price_controller = TextEditingController();
    TextEditingController total_controller = TextEditingController();
    Product_Controller controller_pro = Get.put(Product_Controller());
    return GetBuilder<Product_Controller>(
        init: controller_pro,
        builder: (context) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: name_controller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Name'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: qty_controller,
                          decoration: const InputDecoration(
                            hintText: 'Qty',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: price_controller,
                          keyboardType: TextInputType.number,
                          onChanged: ((newvalue) {
                            int qty = int.parse(qty_controller.text);
                            int price = int.parse(newvalue.toString());
                            total_controller.text = (qty * price).toString();
                          }),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Price')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: total_controller,
                          decoration: const InputDecoration(
                            hintText: 'Total',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Get.to(() => show());
                        },
                        child: const Text('Next Page'),
                        color: Colors.blue,
                      )
                    ],
                  ),
                )
              ],
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    child: const Icon(Icons.save),
                    onPressed: () => controller_pro.addProductCard(
                          Product(
                              id: Random().nextInt(200),
                              name: name_controller.text,
                              qty: int.parse(qty_controller.text),
                              price: double.parse(price_controller.text),
                              total: double.parse(total_controller.text)),
                        )),
                FloatingActionButton(
                  onPressed: () {
                    name_controller.text = '';
                    qty_controller.text = '';
                    price_controller.text = '';
                    total_controller.text = '';
                  },
                  child: const Icon(Icons.restart_alt),
                ),
              ],
            ),
          );
        });
  }
}
