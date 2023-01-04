import 'package:flutter/material.dart';
import 'package:local_database/model/user_model.dart';
import 'package:local_database/t1.dart';
import 'package:local_database/view/create_user_data.dart';
import 'package:local_database/view/update_date.dart';

void main(List<String> args) {
  runApp(home());
}

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: create_user_data(
        user: User(),
        title: 'Ceate User',
      ),
    );
  }
}
