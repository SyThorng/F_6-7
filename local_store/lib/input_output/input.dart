import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:local_store/input_output/ouput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/input_output/ouput.dart';

class input extends StatefulWidget {
  input({super.key});

  @override
  State<input> createState() => _inputState();
}

class _inputState extends State<input> {
  TextEditingController email_controll = new TextEditingController();
  TextEditingController pw_controll = new TextEditingController();

  int i = 0;

  // void get() async {
  //   var pers = await SharedPreferences.getInstance();
  //   await pers.setInt('number', 0);
  // }

  initData() async {
    var pers = await SharedPreferences.getInstance();
    setState(() {
      i = pers.getInt('number') ?? 0;
    });
  }

  // doch window open
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Email',
            style: GoogleFonts.acme(fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            child: TextField(
              controller: email_controll,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email),
                fillColor: Colors.red,
                hintText: 'Input Email',
                border: OutlineInputBorder(
                    // borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Password',
            style: GoogleFonts.acme(fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            child: TextField(
              controller: pw_controll,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                fillColor: Colors.red,
                hintText: 'Input Password',
                border: OutlineInputBorder(
                    // borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Spacer(),
          Container(
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => output1(
                          email: email_controll.text, pw: pw_controll.text),
                    ));
              },
              color: Colors.blue,
              child: Center(
                  child: Text("Sumit", style: GoogleFonts.acme(fontSize: 20))),
            ),
          ),
          Center(child: Text('$i'))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var pers = await SharedPreferences.getInstance();
          setState(() {
            // i++;
            // pers.setInt('number', i);
            pers.setInt('number', ++i);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// void _read() async {
//   final prefs = await SharedPreferences.getInstance();
//   final key = '';
//   final value = prefs.getInt(key) ?? 0;
//   print('read: $value');
// }
