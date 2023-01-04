import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get_x/basic/controller.dart';

class secound_page extends StatelessWidget {
  const secound_page({super.key});

  @override
  Widget build(BuildContext context) {
    cunter_controller control = Get.put(cunter_controller());

    return GetBuilder<cunter_controller>(
        init: control,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
                // title: Text(widget.title),
                ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Badge(
                    toAnimate: false,
                    shape: BadgeShape.square,
                    badgeColor: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(8),
                    badgeContent: Text(
                      control.number.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    child: Icon(
                      Icons.call,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {},
            //   tooltip: 'Increment',
            //   child: const Icon(Icons.add),
            // ),
          );
        });
  }
}
