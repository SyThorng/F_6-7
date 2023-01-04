import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:local_database/connection/user_data.dart';
import 'package:local_database/constant/database_field.dart';
import 'package:local_database/model/user_model.dart';
import 'package:local_database/view/create_user_data.dart';
import 'package:local_database/view/showdata.dart';

class update_data extends StatelessWidget {
  update_data({super.key});

  TextEditingController up_name_controll = TextEditingController();
  TextEditingController up_age_controll = TextEditingController();

  getinitUpdate() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: TextField(
                  controller: up_name_controll,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.red),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Input Name'),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.red),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Input Age'),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => show_data(),
                  ));
            },
            child: Icon(Icons.arrow_back),
          ),
          FloatingActionButton(
            onPressed: () async {},
            child: Icon(Icons.upgrade),
          ),
        ],
      ),
    );
  }
}
