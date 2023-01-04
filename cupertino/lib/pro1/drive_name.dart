import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class drive_name_c2 extends StatelessWidget {
  drive_name_c2(
      {super.key,
      required this.SmartDrivename,
      required this.iconpath,
      required this.powerOn,
      this.onChanged});

  final String SmartDrivename;
  final dynamic iconpath;
  bool powerOn;
  void Function(bool)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
            color: powerOn ? Colors.grey[900] : Colors.grey[200],
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //Icon
            children: [
              Icon(iconpath,
                  size: 40, color: powerOn ? Colors.white : Colors.black),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Expanded(
                        child: Text(
                      SmartDrivename,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: powerOn ? Colors.white : Colors.black,
                      ),
                    )),
                  ),
                  Transform.rotate(
                      angle: pi / 2,
                      child: CupertinoSwitch(
                          value: powerOn, onChanged: onChanged)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
