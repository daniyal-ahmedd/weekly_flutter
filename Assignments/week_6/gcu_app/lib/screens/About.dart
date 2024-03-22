import 'package:flutter/material.dart';
import '../common/menudrawer.dart';
import '../common/ownNavBar.dart';
class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  String message = "";
  TextEditingController cont_name = TextEditingController();
  late int counter;

  @override
  void initState(){
    counter = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About us"), backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        children: [
          TextField(
            controller: cont_name,
            decoration: InputDecoration(hintText: "Please enter your name"),
          ),
          Center(
            child: ElevatedButton(
                  onPressed: onButtonPress, child: Text("Click here!") ,
            ),
          ),
          Text(message)
        ],
      )
    );
  }

  void onButtonPress() {
    setState(() {
      counter = counter + 1;
      message = "Welcome " +
          cont_name.text + 
          ", to our application for the " + 
          counter.toString() + 
          " times";
    });
  }
}