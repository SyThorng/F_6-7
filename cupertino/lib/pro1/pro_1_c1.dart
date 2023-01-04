import 'package:cupertino/pro1/drive_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class pro_c1 extends StatefulWidget {
  const pro_c1({super.key});

  @override
  State<pro_c1> createState() => _pro_c1State();
}

class _pro_c1State extends State<pro_c1> {
  final double holizontalPadding = 40;
  final double vertacalpadding = 25;

  //List
  List ls = [
//SmartDevice ,Iconpath, powerStatus
    ["Ligth", Icons.light, true],
    ["AC", Icons.library_books, false],
    ["TV", Icons.tv, false],
    ["fan", Icons.mode, false],
  ];
  void Swicthchange(bool value, int index) {
    setState(() {
      ls[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //customer app bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: holizontalPadding,
                vertical: vertacalpadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu_sharp,
                        size: 40,
                      )),
                  const Icon(
                    Icons.person,
                    size: 40,
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            )
            //welcome hone MITCH KOKO
            ,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: holizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Home',
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                  Text(
                    'MITCH KOKO',
                    style: GoogleFonts.bebasNeue(fontSize: 70),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Divider(
                thickness: 1,
                color: Colors.grey[400],
              ),
            ),
            //Samrt drive + grid,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Smart Drive',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: GridView.builder(
              itemCount: ls.length,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.3),
              itemBuilder: (context, index) {
                return drive_name_c2(
                  SmartDrivename: ls[index][0],
                  iconpath: ls[index][1],
                  powerOn: ls[index][2],
                  onChanged: (value) => Swicthchange(value, index),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
