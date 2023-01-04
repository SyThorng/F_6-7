import 'package:cupertino/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';

List ls = [
  'https://www.transparentpng.com/thumb/wallet/zucdRL-zippered-wallet-amazing-image.png',
  'https://www.transparentpng.com/thumb/wallet/zucdRL-zippered-wallet-amazing-image.png',
  'https://www.transparentpng.com/thumb/wallet/zucdRL-zippered-wallet-amazing-image.png',
  'https://www.transparentpng.com/thumb/wallet/zucdRL-zippered-wallet-amazing-image.png',
  'https://www.transparentpng.com/thumb/wallet/zucdRL-zippered-wallet-amazing-image.png',
  'https://www.transparentpng.com/thumb/wallet/zucdRL-zippered-wallet-amazing-image.png',
  'https://www.transparentpng.com/thumb/wallet/zucdRL-zippered-wallet-amazing-image.png',
];

class l_tile extends StatelessWidget {
  const l_tile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: List.generate(
        ls.length,
        (index) => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      // color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(ls[index]), fit: BoxFit.cover)),
                ),
                Container(
                  width: 250,
                  height: 100,
                  // color: Colors.green,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 10, left: 5),
                          child: const Text(
                            'Vagabond Sack',
                            style: TextStyle(fontSize: 20),
                          )),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text(
                          '\$120',
                          style: TextStyle(
                              color: Color.fromARGB(153, 158, 158, 158)),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.blue,
                      )),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
