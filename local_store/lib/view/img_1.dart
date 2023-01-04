import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class create_user_screen extends StatelessWidget {
  const create_user_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                  decoration: InputDecoration(
                hintText: 'Enter Name',
                border: OutlineInputBorder(),
              )),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Enter age')),
            ),
          ],
        ),
      ),
    );
  }
}
