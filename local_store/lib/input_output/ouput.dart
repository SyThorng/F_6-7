import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class output1 extends StatelessWidget {
  output1({super.key, required this.email, required this.pw});

  String? email, pw;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text('Email: ${email}'),
            const SizedBox(
              height: 40,
            ),
            Text('Password: ${pw}'),
          ],
        ),
      ),
    );
  }
}
