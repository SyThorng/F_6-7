import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:reposive_flutter/home1/class1.dart';
import 'package:reposive_flutter/home1/class2.dart';
import 'package:reposive_flutter/home1/class3.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const c1(),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 100),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: const BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage('assets/r.png'))),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Easy Approch",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.indigo),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: const Text(
              "Easy Approach makes it easy for everyone to dessiminate knowledge, and making difficult problems easy to solve.",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 15,
                letterSpacing: 0.8,
                color: Color.fromARGB(255, 137, 134, 134),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          c2(),
          Expanded(child: Container()),
          c3()
        ],
      ),
    );
  }
}
