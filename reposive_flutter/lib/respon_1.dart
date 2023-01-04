import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:reposive_flutter/li.dart';

class re1 extends StatelessWidget {
  const re1({super.key});

  @override
  Widget build(BuildContext context) {
    double wsize = MediaQuery.of(context).size.width;
    double hsize = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: wsize >= 1 && wsize < 400 ? 1 : 2,
          // : wsize >= 400 && wsize <= 600
          //     ? 1
          //     : wsize >= 600 && wsize <= 800
          //         ? 2
          //         : wsize >= 1000 && wsize <= 1400
          //             ? 2
          //             : 2,
          children: List.generate(
            obj.length,
            (index) => Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  image:
                      DecorationImage(image: NetworkImage(obj[index]['img']))),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

// GridView.count(
//         crossAxisCount: 1,
//         mainAxisSpacing: 5,
//         crossAxisSpacing: 5,
//         children: List.generate(
//           1,
//           (index) => Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: Container(
//                   width: 300,
//                   height: 250,
//                   // margin: EdgeInsets.only(top: 30, left: 20),
//                   decoration: BoxDecoration(
//                       color: Colors.amber,
//                       image: DecorationImage(
//                           image: NetworkImage(
//                               'https://cdn-icons-png.flaticon.com/512/2784/2784403.png'),
//                           fit: BoxFit.cover)),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: Container(
//                   // margin: EdgeInsets.only(top: 10, left: 20),
//                   width: 300,
//                   height: 250,
//                   color: Colors.red,
//                   child: Column(
//                     children: [
//                       Container(
//                         child: Text(
//                           'Easy Approach',
//                           style: TextStyle(
//                               fontSize: 30,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.blue[600]),
//                         ),
//                       ),
//                       Container(
//                         width: 250,
//                         margin: EdgeInsets.only(top: 20, left: 25),
//                         child: Text(
//                           'Student iCON is web-based. Students can use their web browser in their internet- enabled computing or mobile devices to visit',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),