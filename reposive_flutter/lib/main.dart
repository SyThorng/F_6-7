import 'package:flutter/material.dart';
import 'package:reposive_flutter/home1/homepage.dart';
import 'package:reposive_flutter/respon_1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: homepage(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    //key word size Reposive
    double hSize = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 4,
            scrollDirection: orientation == Orientation.landscape
                ? Axis.horizontal
                : Axis.vertical,
            children: List.generate(
                10,
                (index) => Container(
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(10)),
                    )),
          );
        },
      ),
    );
  }
}

//  body: Center(
//         child: Container(
//           height: 400,
//           width: double.infinity,
//           color: Colors.red,
//           child: Center(
//             child: Text(
//               hSize.toString(),
//               style: TextStyle(fontSize: 28),
//             ),
//           ),
//         ),
//       ),

//  body: GridView.count(
//           crossAxisCount: hSize >= 1 && hSize <= 400
//               ? 1
//               : hSize > 400 && hSize <= 600
//                   ? 2
//                   : hSize > 600 && hSize <= 800
//                       ? 3
//                       : hSize > 800 && hSize <= 1200
//                           ? 4
//                           : 5,
//           mainAxisSpacing: 5,
//           crossAxisSpacing: 5,
//           children: List.generate(
//               10,
//               (index) => Container(
//                     color: Colors.red,
//                   ))),