import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/instance_manager.dart';
import 'package:todo/store_list/class_product.dart';
import 'package:todo/store_list/page2.dart';

class page_1 extends StatefulWidget {
  page_1({super.key});

  @override
  State<page_1> createState() => _page_1State();
}

class _page_1State extends State<page_1> {
  TextEditingController name_controll = TextEditingController();

  TextEditingController qty_controll = TextEditingController();

  TextEditingController price_controll = TextEditingController();

  TextEditingController total_controll = TextEditingController();

  Product_controller product_controller = Get.put(Product_controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode)),
        title: const Text("Hello GetX"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                child: TextField(
                  controller: name_controll,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text('NameProduct')),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                child: TextField(
                  controller: qty_controll,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Pruduct Qunitity')),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      int qty = int.parse(qty_controll.text);
                      double price = double.parse(price_controll.text);
                      total_controll.text = (qty * price).toString();
                    });
                  },
                  controller: price_controll,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Price Product')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                child: TextField(
                  controller: total_controll,
                  enabled: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text('Total')),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => page_2(),
                    ));
              },
              color: Theme.of(context).primaryColor,
              child: const Text('Next Page'),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: (() {}),
                    // onPressed: () => product_controller.addProductCard(Product(
                    //     name: name_controll.text,
                    //     qty: int.parse(qty_controll.text),
                    //     price: double.parse(price_controll.text),
                    //     total: double.parse(total_controll.text))),
                    color: Colors.blue,
                    child: const Text('Save'),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const Text('Clear'),
                    color: Colors.blue,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
