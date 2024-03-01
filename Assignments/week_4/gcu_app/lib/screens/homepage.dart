import 'package:flutter/material.dart';
import '../common/menudrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: const Text("Hackers Den!"),
        backgroundColor: Colors.lightGreenAccent,
        ),
        drawer: const MenuDrawer(),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("download.jpeg"), fit: BoxFit.fill)),
          child:  Center(
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(10, 20)), 
                color: Colors.blueGrey),
              child: Text(
                  "Welcome to the hackers den! 💀",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20,
                  ))),
            )
          )
        ),   
    );
  }
}