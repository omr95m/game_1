import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int leftImageNumber = 1;
  int rightImage = 1;
  fun() {
    leftImageNumber = Random().nextInt(8) + 1;
    rightImage = Random().nextInt(8) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 4, 148, 132),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xffFFC107),
        appBar: AppBar(
          backgroundColor: const Color(0xff00796B),
          title: const Text(
            'لعبة الصور',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              rightImage == leftImageNumber
                  ? '  مبروك لك لقد نجحت '
                  : 'حاول مرة أخرى',
              style: const TextStyle(fontSize: 42, color: Colors.white),
            ),
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      fun();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('images/image-$leftImageNumber.png'),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      leftImageNumber = Random().nextInt(8) + 1;
                      rightImage = Random().nextInt(8) + 1;
                    });
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('images/image-$rightImage.png')),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
