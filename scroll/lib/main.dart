import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const tt());
}

class tt extends StatelessWidget {
  const tt({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(62, 0, 0, 0),
        title: const Text('HOMEWORK'),
      ),
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
        child: Column(
            children: List.generate(
          20,
          (index) => const Card(
            elevation: 2,
            child: ListTile(
              title: Text(
                'sss1',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('NIGG1'),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/1.jpeg'),
              ),
              trailing: Icon(Icons.fork_left),
            ),
          ),
        )),
      ),
    );
  }
}
