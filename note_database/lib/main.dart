import 'package:flutter/material.dart';
import 'package:note_database/model/user.dart';
import 'package:note_database/page_show.dart';

void main(List<String> args) {
  runApp(kk());
}

class kk extends StatelessWidget {
  const kk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: page_show(),
      debugShowCheckedModeBanner: false,
    );
  }
}
