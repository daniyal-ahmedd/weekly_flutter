import 'package:flutter/material.dart';

void main() {
  runApp(const GCUAPP());
}

class GCUAPP extends StatelessWidget {
  const GCUAPP({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: const Text("Hackers Den!"),
        backgroundColor: Colors.lightGreenAccent,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("download.jpeg"), fit: BoxFit.fill)),
          child: const Center(
              child: Text(
                  "Welcome to the hackers den! 💀",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20,
                  ))),
          )
        ),   
    );
  }
}