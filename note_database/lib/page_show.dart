import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:note_database/database/dbHelper.dart';
import 'package:note_database/model/user.dart';
import 'package:note_database/page_add/page_add.dart';

class page_show extends StatefulWidget {
  page_show({super.key});

  @override
  State<page_show> createState() => _page_showState();
}

class _page_showState extends State<page_show> {
  late Dbhelper db;
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    db = Dbhelper();
    db.getUser().then((value) {
      setState(() {
        users = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
                child: Text(
              'Note ${users.length}',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
            Column(
                children: List.generate(
              users.length,
              (index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => page_add(
                          user: users[index],
                        ),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    height: 130,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(children: [
                        Container(
                            margin: EdgeInsets.only(left: 320, top: 10),
                            child: IconButton(
                              onPressed: () async {
                                await Dbhelper().delete(
                                  users[index].utitle.toString(),
                                );
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 20,
                                color: Colors.black,
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            //tile index
                            users[index].utitle.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 280),
                          child: Text(
                            users[index].uper.toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            margin: EdgeInsets.only(top: 30),
                            height: 50,
                            // color: Colors.amber,
                            child: Text(
                              users[index].unote.toString(),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 90),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  users[index].utime.toString(),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: HexColor(
                                        users[index].ucolor.toString()),
                                    shape: BoxShape.circle),
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Color.fromARGB(69, 158, 158, 158),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => page_add(
                  user: User(
                    utitle: '',
                  ),
                ),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
