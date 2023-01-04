import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(U1());
}

class U1 extends StatelessWidget {
  const U1({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      home: const Home2(),
    );
  }
}

class Home2 extends StatelessWidget {
  const Home2({super.key});

  get conts => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.grey[400],
      ),
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
        title: Text('HOMEWORK'),
        backgroundColor: Colors.black38,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.all(20),
          height: 130,
          decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black)),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                // color: Colors.black87,
                width: 100,
                height: 100,
                child: Image(
                    image: NetworkImage(
                        'https://mystickermania.com/cdn/stickers/cartoons/tom-and-jerry-bored-tom-512x512.png')),
                // child: Row(children: [
                //   Container(
                //     margin: EdgeInsets.all(30),
                //     child: Icon(
                //       Icons.person,
                //       color: Colors.white,
                //     ),
                //   )
                // ]),
              ),
              Container(
                // margin: EdgeInsets.all(1),
                // color: Color.fromARGB(221, 199, 220, 10),
                width: 130,
                height: 100,
                child: Column(
                  children: [
                    Container(
                      // ignore: prefer_const_constructors
                      margin: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Text(
                            "KOKO",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on),
                        const Text('India')
                      ],
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Icon(Icons.call),
                          ),
                          Container(
                            child: Text('+855 972133'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          height: 130,
          decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black)),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                // color: Colors.black87,
                width: 100,
                height: 100,
                child: Image(image: AssetImage('assets/2.gif')),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                // color: Colors.blue,
                width: 160,
                height: 100,
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 100, 0),
                    child: Text(
                      'OGGY',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        child: Icon(Icons.location_on),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                        child: Text(
                          'Fance',
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 10, 10),
                        child: Icon(Icons.call),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: Text('+855 8823484'),
                      )
                    ],
                  )
                ]),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          height: 130,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color.fromARGB(255, 231, 30, 15)),
          ),
          child: Row(children: [
            Container(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                // color: Colors.green,
                width: 100,
                height: 100,
                child: Image(image: AssetImage('assets/3.jpeg')),
              ),
            ),
            Container(
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                // color: Colors.amber,
                width: 160,
                height: 100,
                child: Column(
                  children: [
                    Container(
                      // color: Colors.blue[50],
                      width: double.infinity,
                      child: Text(
                        'TOM',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            backgroundColor: Colors.green),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      color: Colors.black,
                      child: Row(
                        children: [
                          Container(
                            color: Color.fromARGB(255, 223, 12, 83),
                            child: Icon(Icons.location_on),
                          ),
                          Container(
                            color: Colors.amber[50],
                            child: Text('Spain'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      color: Colors.blue,
                      child: Row(
                        children: [
                          Container(
                            color: Color.fromARGB(255, 132, 229, 219),
                            child: Icon(Icons.call),
                          ),
                          Container(
                            color: Colors.amber[100],
                            child: Text('+854 71480023'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          height: 130,
          decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 5)),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                // color: Colors.black87,
                width: 100,
                height: 100,
                child: Image(image: AssetImage('assets/a1.gif')),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                // color: Colors.blue,
                width: 160,
                height: 100,
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 100, 0),
                    child: Text(
                      'JECKY',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        child: Icon(Icons.location_on),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                        child: Text(
                          'Germany',
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 10, 10),
                        child: Icon(Icons.call),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: Text('+855 77328933'),
                      )
                    ],
                  )
                ]),
              )
            ],
          ),
        ),
      ]),
      backgroundColor: Color.fromARGB(148, 158, 158, 158),
    );
  }
}


// Container(
//                       color: Colors.blue,
//                       child: Text('OGGY'),
//                     ),
//                     Container(
//                       child: Text('jajas'),
//                     ),
//                     Container(
//                       child: Text('jajas'),
//                     ),