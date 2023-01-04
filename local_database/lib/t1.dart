import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class t1 extends StatelessWidget {
  const t1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.amber,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.teal,
            ),
            Container(
              child: Lottie.network(
                  'https://assets1.lottiefiles.com/packages/lf20_jdqkcnl5.json'),
            )
          ],
        ),
      ),
    );
  }
}


//  child: Lottie.network(
//             'https://assets1.lottiefiles.com/packages/lf20_jdqkcnl5.json'),
