import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get_x/getx_by_list/cunter_class.dart';

class show extends StatelessWidget {
  const show({super.key});

  @override
  Widget build(BuildContext context) {
    Product_Controller controll_pro = Get.put(Product_Controller());
    return GetBuilder<Product_Controller>(
        init: controll_pro,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: List.generate(
                  controll_pro.products.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ListTile(
                            onTap: () {},
                            leading: CircleAvatar(
                              child: Text(
                                  '${controll_pro.products[index].qty.toString()}'),
                            ),
                            trailing: Text(
                                '${controll_pro.products[index].total.toString()}'),
                            title: Text('${controll_pro.products[index].name}'),
                            subtitle: Text(
                                '${controll_pro.products[index].price.toString()}\$'),
                          ),
                        ),
                      )),
            ),
          );
        });
  }
}
