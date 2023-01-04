import 'package:app_favorite_getx/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class dark_mode extends StatefulWidget {
  const dark_mode({super.key});

  @override
  State<dark_mode> createState() => _dark_modeState();
}

class _dark_modeState extends State<dark_mode> {
  bool b = false;

  @override
  Widget build(BuildContext context) {
    ThemeModeController controller = Get.put(ThemeModeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(b == false ? Icons.light_mode : Icons.dark_mode),
            title: Text(b == false ? 'Light Mode' : 'Dark Mode'),
            trailing: CupertinoSwitch(
              value: b,
              onChanged: (value) {
                setState(() {
                  b = value;
                  if (b == true) {
                    Get.isDarkMode;
                    Get.changeTheme(ThemeData.dark());
                  } else {
                    // Get.isDarkMode;
                    Get.changeTheme(ThemeData.light());
                  }
                });
              },
            ),
            // trailing: IconButton(
            //   onPressed: () {
            //     Get.isDarkMode ? ThemeData.light() : ThemeData.dark();
            //   },
            //   icon: Icon(Icons.card_membership_outlined),
            // ),
          )
        ],
      ),
    );
  }
}
