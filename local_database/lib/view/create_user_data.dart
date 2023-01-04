import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_database/connection/user_data.dart';
import 'package:local_database/model/user_model.dart';
import 'package:local_database/view/showdata.dart';
import 'package:local_database/view/update_date.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class create_user_data extends StatefulWidget {
  create_user_data({super.key, required this.user, required this.title});

  User user;
  String title;
  @override
  State<create_user_data> createState() => _create_user_dataState();
}

class _create_user_dataState extends State<create_user_data> {
  File? fileImage;

  getUserupdate() {
    setState(() {
      name_controller.text = widget.user.name!;
      age_controller.text = widget.user.age.toString();
      fileImage = File(widget.user.image.toString());
    });
  }

  Future openCamera() async {
    final file = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      fileImage = File(file!.path);
    });
  }

  Future getImageFromGallary() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      fileImage = File(file!.path);
    });
  }

  TextEditingController name_controller = TextEditingController();

  TextEditingController age_controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.user.uid != null) {
      getUserupdate();
    }
  }

  final Uri _url = Uri.parse('https://github.com/SyThorng');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(widget.title),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actionsAlignment: MainAxisAlignment.center,
                        title: const Text('Choose one option'),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              openCamera();
                              Navigator.pop(context);
                            },
                            child: const Text('Camera'),
                            color: Colors.redAccent,
                          ),
                          MaterialButton(
                            onPressed: () {
                              getImageFromGallary();
                              Navigator.pop(context);
                            },
                            child: const Text('Gallery'),
                            color: Colors.blue,
                          )
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.camera_alt),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => show_data(),
                        ));
                  },
                  icon: const Icon(Icons.menu))
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: IconButton(
                  onPressed: _launchUrl,
                  icon: Icon(Icons.local_print_shop_outlined)),
              // child: Lottie.network(
              //     'https://assets9.lottiefiles.com/private_files/lf30_dmituz7c.json'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey,
                    image: fileImage == null
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://i.pinimg.com/736x/05/c7/9e/05c79ee812c45a7535f749cf5e49e94e--empty-state-ui-app-ui.jpg'))
                        : DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(File(fileImage!.path)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: name_controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: age_controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter Age'),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await widget.user.uid == null
              ? ConnectDB()
                  .insertUser(User(
                      uid: DateTime.now().millisecond,
                      name: name_controller.text,
                      age: int.parse(age_controller.text),
                      image: fileImage!.path.toString()))
                  .then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => show_data(),
                      )))
              : ConnectDB()
                  .updateUser(
                    User(
                        name: name_controller.text,
                        age: int.parse(age_controller.text),
                        uid: widget.user.uid,
                        image: fileImage!.path.toString()),
                  )
                  .then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => show_data(),
                      )));
        },
        child: Icon(widget.user.uid == null ? Icons.save : Icons.done),
      ),
      // backgroundColor: Color.fromARGB(134, 199, 194, 194),
    );
  }
}
