import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:note_database/contant/fild.dart';
import 'package:note_database/database/dbHelper.dart';
import 'package:note_database/model/user.dart';
import 'package:note_database/page_show.dart';

class page_add extends StatefulWidget {
  page_add({super.key, required this.user});
  User user;

  @override
  State<page_add> createState() => _page_addState();
}

class _page_addState extends State<page_add> {
  void getUserupdate() {
    setState(() {
      con_note.text = widget.user.unote!;
      con_tile.text = widget.user.utitle!;
      selectItem = widget.user.uper!;
      sol[0] = widget.user.ucolor.toString();
    });
  }

  TextEditingController con_tile = TextEditingController();
  TextEditingController con_note = TextEditingController();

  late Dbhelper db;
  List<User> users = [];
  List sol = ['#f5f3f0'];
  List<String> Items = ['person', 'Student', 'Employee', 'Staff'];
  String? selectItem;

  List<String> col1 = [
    '#f5f3f0'
        '#fcba03',
    '#1703fc',
    '#bf30b3',
    '#18c3cc',
    '#3fcc29',
  ];
  int index_col = 1;

  void select(int dex) {
    setState(() {
      index_col = dex;
    });
  }

  @override
  void initState() {
    super.initState();
    db = Dbhelper();
    db.getUser().then((value) {
      setState(() {
        value = users;
      });
    });
    if (widget.user.utitle.toString() != '') {
      getUserupdate();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CupertinoButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => page_show(),
                              ));
                        }),
                    Container(
                      margin: const EdgeInsets.only(left: 60),
                      child: Text(
                        'add Note',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 70),
                        child: CupertinoButton(
                            child: const Text('Save'), onPressed: () {})),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: con_tile,
                decoration: InputDecoration(
                  label: Text('Title'),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: con_note,
                maxLines: 5,
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text('Write a Note'),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 239, 231, 231),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Category',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 140,
                        height: 50,
                        // color: Colors.green,
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: HexColor(widget.user.utitle == ''
                                    ? col1[index_col]
                                    : widget.user.utitle != ''
                                        ? sol[0]
                                        : col1[index_col]),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 100,
                            height: 30,
                            child: Container(
                              // decoration: BoxDecoration(
                              //     border: Border.all(color: Colors.orange)),
                              child: DropdownButton<String>(
                                dropdownColor: Colors.grey[300],
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 25,
                                hint: Text('Item'),
                                value: selectItem,
                                onChanged: (value) {
                                  setState(() {
                                    selectItem = value;
                                  });
                                },
                                items: Items.map((e) {
                                  return DropdownMenuItem(
                                      value: e, child: Text(e));
                                }).toList(),
                              ),
                            ),
                            // color: Color.fromARGB(255, 195, 33, 228),
                          )
                        ]),
                      )
                    ]),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: List.generate(
                      col1.length,
                      (index) => InkWell(
                        onTap: () {
                          select(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: HexColor(col1[index]),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Text(col1[index_col])
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FloatingActionButton(
                onPressed: () async {
                  await Dbhelper().insertUser(
                    User(
                        utitle: con_tile.text,
                        unote: con_note.text,
                        ucolor: col1[index_col],
                        utime: DateTime.now().toString(),
                        uper: selectItem),
                  );
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      actions: [
                        Column(
                          children: [
                            Lottie.network(
                              'https://assets6.lottiefiles.com/private_files/lf30_yo2zavgg.json',
                            ),
                            CupertinoButton(
                                child: Text('done'),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => page_show(),
                                      ));
                                })
                          ],
                        )
                      ],
                    ),
                  );
                },
                child: Icon(Icons.save)),
          ),
          FloatingActionButton(
            onPressed: () {
              // print('object123');
              Dbhelper().updateUser(User(
                  utitle: con_tile.text,
                  unote: con_note.text,
                  ucolor: col1[index_col],
                  uper: selectItem,
                  utime: DateTime.now().toString()));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => page_show(),
                  ));
            },
            child: Icon(Icons.upgrade),
          )
        ],
      ),
    );
  }
}
