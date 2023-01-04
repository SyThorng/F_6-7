import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo/store_list/class_product.dart';

class page_2 extends StatefulWidget {
  page_2({super.key});

  @override
  State<page_2> createState() => _page_2State();
}

class _page_2State extends State<page_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          var pro = Product_controller().products[index];
          return ListTile(
            leading: CircleAvatar(child: Text(pro.qty.toString())),
            title: Text(pro.name),
            subtitle: Text(pro.price.toString()),
            trailing: Text(pro.total.toString()),
          );
        },
      ),
    );
  }
}
