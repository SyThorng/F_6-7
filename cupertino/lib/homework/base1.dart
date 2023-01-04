import 'package:cupertino/homework/list_tile_cup.dart';
import 'package:cupertino/homework/t1.dart';
import 'package:cupertino/pro1/pro_1_c1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class base_1 extends StatelessWidget {
  const base_1({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Cupertino Store'),
      ),
      child: t_1(),
    );
  }
}
