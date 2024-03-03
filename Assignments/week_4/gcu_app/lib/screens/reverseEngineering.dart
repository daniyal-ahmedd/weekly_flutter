import 'package:flutter/material.dart';
import '../common/menudrawer.dart';
import '../common/ownNavBar.dart';
class reverseEngineering extends StatelessWidget {
  const reverseEngineering({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reverse Engineering"),
        backgroundColor: Colors.lightGreenAccent,
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: ownNavBar(),
      body: Center(child: Text("Read the book 'Practical Malware Analysis: A Hands-On Guide to Dissecting Malicious Software', the best resource for learning reverse engineering.")),
    );
  }
}