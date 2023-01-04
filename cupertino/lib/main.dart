import 'package:cupertino/homework/base1.dart';
import 'package:cupertino/homework/list_tile_cup.dart';
import 'package:cupertino/pro1/pro_1_c1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      // theme: CupertinoThemeData(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: l_tile(),
      home: base_1(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   bool check = false;
//   Duration duration = const Duration(hours: 1, minutes: 59, milliseconds: 60);
//   @override
//   Widget build(BuildContext context) {
//     return
//         // CupertinoPageScaffold(
//         //   // appBar: AppBar(
//         //   //   title: Text(widget.title),
//         //   // ),
//         //   child: Center(
//         //     child: Column(
//         //       mainAxisAlignment: MainAxisAlignment.center,
//         //       children: [
//         //         CupertinoSearchTextField(),
//         //         // Text('Wifi'),
//         //         CupertinoSwitch(
//         //           value: check,
//         //           onChanged: (value) {
//         //             setState(() {
//         //               check = value;
//         //             });
//         //           },
//         //         ),
//         //         CupertinoTimerPicker(
//         //           // mode: CupertinoTimerPickerMode.hm,
//         //           initialTimerDuration: duration,
//         //           // This is called when the user changes the timer duration.
//         //           onTimerDurationChanged: (Duration newDuration) {
//         //             setState(() => duration = newDuration);
//         //           },
//         //         ),
    //   CupertinoTabScaffold(
    //   tabBar: CupertinoTabBar(
    //     items: const <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //         icon: Icon(CupertinoIcons.star_fill),
    //         label: 'Favourites',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(CupertinoIcons.clock_solid),
    //         label: 'Recents',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(CupertinoIcons.person_alt_circle_fill),
    //         label: 'Contacts',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(CupertinoIcons.circle_grid_3x3_fill),
    //         label: 'Keypad',
    //       ),
    //     ],
    //   ),
    //   tabBuilder: (BuildContext context, int index) {
    //     return CupertinoTabView(
    //       builder: (BuildContext context) {
    //         return Center(
    //           child: Text(''),
    //         );
    //       },
    //     );
    //   },
    // );
//     //        ],
//     //     ),
//     //   ),
//     // );
//   }
// }
