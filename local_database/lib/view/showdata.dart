import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:local_database/connection/user_data.dart';
import 'package:local_database/constant/database_field.dart';
import 'package:local_database/model/user_model.dart';
import 'package:local_database/view/create_user_data.dart';
import 'package:local_database/view/update_date.dart';

class show_data extends StatefulWidget {
  show_data({super.key});

  @override
  State<show_data> createState() => _show_dataState();
}

class _show_dataState extends State<show_data> {
  late Future<List<User>> listUser;
  late ConnectDB db;
  List<User> users = [];
  Future<List<User>> getlist() async {
    return await db.getUser();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db = ConnectDB();
    db.getUser().then((value) {
      setState(() {
        users = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Data'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => create_user_data(
                          user: users[index], title: 'Update User'),
                    ));
              },
              title: Text(users[index].name.toString()),
              subtitle: Text(users[index].age.toString()),
              leading: CircleAvatar(
                backgroundImage: FileImage(File(users[index].image.toString())),
              ),

              //show ID that we use as Auto ID
              // leading: CircleAvatar(child: Text(users[index].uid.toString())),

              trailing: IconButton(
                  onPressed: () async {
                    await ConnectDB().delete(users[index].age!);
                    setState(() {});
                  },
                  icon: Icon(Icons.delete)),
            ),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => update_data(),
      //         ));
      //   },
      //   child: Icon(Icons.upload_file),
      // ),
    );
  }
}
